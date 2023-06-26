import 'package:chatgpt_new/services/export_service.dart';
import 'package:chatgpt_new/services/local_store.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import 'data/database.dart';
import 'services/chatgpt_service.dart';
import 'services/record_service.dart';

final chatgpt = ChatGPTService();
final recorder = RecordService();
final exportService = ExportService();

final logger = Logger(level: kDebugMode ? Level.verbose : Level.info);

const uuid = Uuid();

late AppDatabase db;

setupDatabase() async {
  db = await initDatabase();
}

final localStorage = LocalStoreService();
