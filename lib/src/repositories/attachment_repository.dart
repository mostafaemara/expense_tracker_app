import 'dart:io';

abstract class AttachmentRepository {
  Future<File> readAttachment(String uid, String id);
  Future<void> writeAttachment(String uid, String id, File file);
}
