import 'package:chatgpt_new/widgets/gpt_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../injection.dart';
import '../models/message.dart';
import '../models/session.dart';
import '../states/chat_ui_state.dart';
import '../states/message_state.dart';
import '../states/session_state.dart';

class ChatInputWidget extends HookConsumerWidget {
  const ChatInputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final voiceModel = useState(false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                voiceModel.value = !voiceModel.value;
              },
              icon: Icon(
                  voiceModel.value ? Icons.keyboard : Icons.keyboard_voice)),
          Expanded(
            child: voiceModel.value
                ? const AudioInputWidget()
                : const TextInputWidget(),
          ),
        ],
      ),
    );
  }
}

class AudioInputWidget extends HookConsumerWidget {
  const AudioInputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recording = useState(false);
    final transcripting = useState(false);
    final uiState = ref.watch(chatUiProvider);
    return SizedBox(
      height: 36,
      child: transcripting.value || uiState.requestLoading
          ? ElevatedButton(
              onPressed: null,
              child: Text(transcripting.value ? "Transcripting..." : "Loading"))
          : GestureDetector(
              onLongPressStart: (details) {
                recording.value = true;
                recorder.start();
              },
              onLongPressEnd: (details) async {
                recording.value = false;
                final path = await recorder.stop();
                if (path != null) {
                  try {
                    transcripting.value = true;
                    final text = await chatgpt.speechToText(path);
                    transcripting.value = false;
                    if (text.trim().isNotEmpty) {
                      await __sendMessage(ref, text);
                    }
                  } catch (err) {
                    logger.e("err:$err", err);
                    transcripting.value = false;
                  }
                }
              },
              onLongPressCancel: () {
                recording.value = false;
                recorder.stop();
              },
              child: ElevatedButton(
                onPressed: () {},
                child: Text(recording.value ? 'Recording...' : 'Hold to speak'),
              ),
            ),
    );
  }
}

class TextInputWidget extends HookConsumerWidget {
  const TextInputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(chatUiProvider);
    final controller = useTextEditingController();

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: 'Type a message...',
        suffixIcon: SizedBox(
          width: 40,
          child: uiState.requestLoading
              ? const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    //这里处理发送事件
                    if (controller.text.trim().isNotEmpty) {
                      _sendMessage(ref, controller);
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
        ),
      ),
    );
  }
}

_sendMessage(WidgetRef ref, TextEditingController controller) {
  final content = controller.text;
  controller.clear();
  return __sendMessage(ref, content);
}

__sendMessage(WidgetRef ref, String content) async {
  Message message = _createMessage(content);
  final uiState = ref.watch(chatUiProvider);
  var active = ref.watch(activeSessionProvider);

  var sessionId = active?.id ?? 0;
  if (sessionId <= 0) {
    active = Session(title: content, model: uiState.model.value);
    // final id = await db.sessionDao.upsertSession(active);
    active = await ref
        .read(sessionStateNotifierProvider.notifier)
        .upsertSession(active);
    sessionId = active.id!;
    ref
        .read(sessionStateNotifierProvider.notifier)
        .setActiveSession(active.copyWith(id: sessionId));
  }

  ref.read(messageProvider.notifier).upsertMessage(
        message.copyWith(sessionId: sessionId),
      ); // 添加消息
  _requestChatGPT(ref, content, sessionId: sessionId);
}

_requestChatGPT(
  WidgetRef ref,
  String content, {
  int? sessionId,
}) async {
  final uiState = ref.watch(chatUiProvider);
  ref.read(chatUiProvider.notifier).setRequestLoading(true);
  final messages = ref.watch(activeSessionMessagesProvider);
  final activeSession = ref.watch(activeSessionProvider);
  try {
    final id = uuid.v4();
    await chatgpt.streamChat(
      messages,
      model: activeSession?.model.toModel() ?? uiState.model,
      onSuccess: (text) {
        final message =
            _createMessage(text, id: id, isUser: false, sessionId: sessionId);
        ref.read(messageProvider.notifier).upsertMessage(message);
      },
    );
  } catch (err) {
    logger.e("requestChatGPT error: $err", err);
  } finally {
    ref.read(chatUiProvider.notifier).setRequestLoading(false);
  }
}

Message _createMessage(
  String content, {
  String? id,
  bool isUser = true,
  int? sessionId,
}) {
  final message = Message(
    id: id ?? uuid.v4(),
    content: content,
    isUser: isUser,
    timestamp: DateTime.now(),
    sessionId: sessionId ?? 0,
  );
  return message;
}
