import 'package:chatgpt_new/injection.dart';
import 'package:chatgpt_new/states/chat_ui_state.dart';
import 'package:chatgpt_new/states/message_state.dart';
import 'package:chatgpt_new/states/session_state.dart';
import 'package:chatgpt_new/tool/files.dart';
import 'package:chatgpt_new/tool/share.dart';
import 'package:chatgpt_new/util/utils.dart';
import 'package:chatgpt_new/widgets/send_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:screenshot/screenshot.dart';

import 'received_message_item.dart';

class ChatMessageList extends HookConsumerWidget {
  final ScrollController listController;
  const ChatMessageList({super.key, required this.listController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(activeSessionMessagesProvider);
    final uiState = ref.watch(chatUiProvider);
    ref.listen(activeSessionMessagesProvider, (previous, next) {
      Future.delayed(const Duration(milliseconds: 50), () {
        listController.jumpTo(listController.position.maxScrollExtent);
      });
    });

    return ListView.separated(
      controller: listController,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return msg.isUser
            ? SendMessageItem(
                message: msg,
                backgroundColor: const Color(0xFF8FE869),
              )
            : ReceivedMessageItem(
                message: msg,
                typing: index == messages.length - 1 && uiState.requestLoading,
              );
      },
      itemCount: messages.length, // 消息数量
      separatorBuilder: (context, index) => const Divider(
        // 分割线
        height: 16,
        color: Colors.transparent,
      ),
    );
  }
}

class ChatMessageListWidget extends HookConsumerWidget {
  const ChatMessageListWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(activeSessionProvider);
    final scrollController = useScrollController();
    final screenshotController = ScreenshotController();
    final chatListKey = GlobalKey();
    return Column(
      key: chatListKey,
      children: [
        Expanded(
          child: Screenshot(
            controller: screenshotController,
            child: ChatMessageList(
              listController: scrollController,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                if (active != null) {
                  if (isDesktop()) {
                    final path = await saveAs(fileName: '${active.title}.md');
                    if (path == null) return;
                    exportService.exportMarkdown(active, path: path);
                  } else {
                    final output = await exportService.exportMarkdown(active);
                    if (output == null) return;
                    shareFiles([output]);
                  }
                }
              },
              icon: const Icon(Icons.text_snippet),
            ),
            IconButton(
              onPressed: () async {
                if (active != null) {
                  final renderbox = chatListKey.currentContext!
                      .findRenderObject() as RenderBox; //获取组件的渲染对象
                  //listview 滚动到底部
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                  //Future.delayed(const Duration(milliseconds: 500)
                  //计算listview所有的高度
                  final height = scrollController.position.maxScrollExtent +
                      scrollController.position.viewportDimension;

                  if (isDesktop()) {
                    final path = await saveAs(fileName: '${active.title}.png');
                    if (path == null) return;
                    exportService.exportImage(active,
                        context: ref.context,
                        targetSize:
                            Size(renderbox.size.width + 32, height + 48),
                        path: path);
                  } else {
                    final output = await exportService.exportImage(
                      active,
                      context: ref.context,
                      targetSize: Size(renderbox.size.width + 32, height + 48),
                    );
                    if (output == null) return;
                    shareFiles([output]);
                  }
                }
              },
              icon: const Icon(Icons.image),
            ),
          ],
        )
      ],
    );
  }
}
