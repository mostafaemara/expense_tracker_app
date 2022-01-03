import 'package:hive_flutter/hive_flutter.dart';

class AttachmentPathProvider {
  final boxName = "attachments";

  Future<String> readAttachmentPath(String id) async {
    final box = await Hive.openBox(boxName);
    final attachmentPath = await box.get(id);
    await box.close();
    return attachmentPath;
  }

  Future<void> writeAttachmentPath(String id, String path) async {
    final box = await Hive.openBox(boxName);
    await box.put(id, path);
    await box.close();
  }
}
