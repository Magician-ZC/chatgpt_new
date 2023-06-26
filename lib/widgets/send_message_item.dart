import 'package:flutter/material.dart';

import '../models/message.dart';
import '../util/triangle.dart';
import 'message_content_widget.dart';

class SendMessageItem extends StatelessWidget {
  final Message message;
  final Color backgroundColor;
  final double radius;

  const SendMessageItem(
      {super.key,
      required this.message,
      this.backgroundColor = Colors.white,
      this.radius = 8});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(left: 48),
            child: MessageContentWidget(message: message),
          ),
        ),
        CustomPaint(
          painter: Triangle(backgroundColor),
        ),
        const SizedBox(
          width: 8,
        ),
        const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            'A',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
