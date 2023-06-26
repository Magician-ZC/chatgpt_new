import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../injection.dart';

class RecordService {
  final r = Record();
  Future start({String? fileName}) async {
    if (await r.hasPermission()) {
      if (await isRecording) {
        logger.e("is recording");
        return;
      }
      final path = await getTemporaryDirectory();

      final d = Directory("${path.absolute.path}/audios");
      await d.create(recursive: true);

      final file = File(
          "${d.path}/${fileName ?? DateTime.now().millisecondsSinceEpoch}.m4a");
      logger.v('start path: ${file.path}');

      await r.start(
        //iOS 和 macOS应用需要Uri格式
        //如果是Windows 和Android 直接使用文件路径
        path: isApplePlatform() ? Uri.file(file.path).toString() : file.path,
      );
    }
  }

  Future<String?> stop() async {
    final path = await r.stop();
    logger.v('stop path: $path');
    if (path == null) return null;
    return isApplePlatform() ? Uri.parse(path).toFilePath() : path;
  }

  Future<bool> get isRecording => r.isRecording();

  bool isApplePlatform() {
    return Platform.isIOS || Platform.isMacOS;
  }
}
