import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/message.dart';
import '../util/triangle.dart';
import 'message_content_widget.dart';

class ReceivedMessageItem extends StatelessWidget {
  const ReceivedMessageItem({
    super.key,
    required this.message,
    this.backgroundColor = Colors.white,
    this.radius = 8,
    this.typing = false,
  });

  final Message message;
  final Color backgroundColor;
  final double radius;
  final bool typing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            "assets/images/chatgpt.svg",
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        CustomPaint(
          painter: Triangle(backgroundColor),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(right: 48),
            child: MessageContentWidget(
              message: message,
              typing: typing,
            ),
          ),
        ),
      ],
    );
  }
}
