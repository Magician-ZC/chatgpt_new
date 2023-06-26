import 'package:chatgpt_new/states/chat_ui_state.dart';
import 'package:chatgpt_new/states/session_state.dart';
import 'package:chatgpt_new/widgets/chat_input_widget.dart';
import 'package:chatgpt_new/widgets/gpt_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/chat_message_list.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSession = ref.watch(activeSessionProvider);
    return Container(
      color: const Color(0xFFF1F1F1),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GptModelWidget(
            active: activeSession?.model.toModel(),
            onModelChanged: (model) {
              ref.read(chatUiProvider.notifier).model = model;
            },
          ),
          const Expanded(
            //聊天消息列表
            child: ChatMessageListWidget(),
          ),
          //输入框
          const ChatInputWidget()
        ],
      ),
    );
  }
}
