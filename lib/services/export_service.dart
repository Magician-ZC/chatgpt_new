import 'dart:io';

import 'package:chatgpt_new/models/session.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../injection.dart';

class ExportService {
  Future<String?> exportMarkdown(
    Session session, {
    String? path,
  }) async {
    final messages = await db.messageDao.findMessagesBySessionId(session.id!);
    final buffer = StringBuffer();
    for (var element in messages) {
      var content = element.content;
      if (element.isUser) {
        content = "> $content"; // markdown 引用，为了区分消息内容是否是用户的
      }
      buffer.writeln();
      buffer.writeln(content);
    }
    logger.v(buffer.toString());
    final docDir = await getApplicationDocumentsDirectory();
    final dir = Directory("${docDir.path}/exports/markdown");
    logger.v("$dir"); // 如果想知道目录是啥，这里可以打印一下
    await dir.create(recursive: true);
    final file = File(path ?? "${dir.path}/${session.id}.md");
    await file.writeAsString(buffer.toString());
    return file.path;
  }

  //size: 截图大小，为了能够截取合适的大小，请传入组件的实际大小
  Future<String?> exportImage(
    Session session, {
    BuildContext? context,
    Size? targetSize,
    String? path,
  }) async {
    final controller = ScreenshotController();
    final messages = await db.messageDao.findMessagesBySessionId(session.id!);
    final key = GlobalKey();
    final widget = SingleChildScrollView(
      child: RepaintBoundary(
        key: key,
        child: Container(
          color: const Color(0xFFF1F1F1),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              for (var element in messages)
                Container(
                  alignment: element.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                    ),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: element.isUser
                          ? const Color(0xFFE1FFC7)
                          : const Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(element.content),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
    // ignore: use_build_context_synchronously
    final img = await controller.captureFromWidget(
      widget,
      context: context,
      targetSize: targetSize,
    );
    final docDir = await getApplicationDocumentsDirectory();
    final dir = Directory("${docDir.path}/exports/img");
    await dir.create(recursive: true);
    final fileToSave = "${dir.path}/${session.id}.png";
    final file = File(path ?? fileToSave);
    file.writeAsBytes(img);
    return file.path;
  }
}
