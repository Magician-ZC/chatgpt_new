import 'package:chatgpt_new/markdown/code_wrapper.dart';
import 'package:chatgpt_new/markdown/latex.dart';
import 'package:chatgpt_new/models/message.dart';
import 'package:chatgpt_new/widgets/typing_cursor.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MessageContentWidget extends StatelessWidget {
  final bool typing;
  final Message message;

  const MessageContentWidget({
    super.key,
    required this.message,
    this.typing = false,
  });

  @override
  Widget build(BuildContext context) {
    codeWrapper(child, text) => CodeWrapperWidget(child: child, text: text);
    return SelectionArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...MarkdownGenerator(
            config: MarkdownConfig().copy(configs: [
              const PreConfig().copy(wrapper: codeWrapper),
            ]),
            generators: [
              latexGenerator,
            ],
            inlineSyntaxes: [
              LatexSyntax(),
            ],
          ).buildWidgets(message.content),
          if (typing) const TypingCursor(),
        ],
      ),
    );
  }
}
