import 'dart:developer';
import 'dart:io';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';

import 'package:expense_tracker_app/src/data/repositories/attachment_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/attachment_path_provider.dart';

import 'package:path_provider/path_provider.dart';

class AttachmentReposiotryImpl implements AttachmentRepository {
  final _attachmentPathProvider = AttachmentPathProvider();

  @override
  Future<File> readAttachment(String uid, id) async {
    try {
      final path = await _attachmentPathProvider.readAttachmentPath(id);

      return File(path);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> writeAttachment(String uid, String id, File file) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final renamedFile = await _changeFileNameOnly(file, id);
      final filePath = "${appDir.path}/attachments/$uid/images/";

      await _createUserDirectoryIfExists(filePath);
      final movedFile = await _moveToDirectory(renamedFile, filePath);

      await _attachmentPathProvider.writeAttachmentPath(id, movedFile.path);
    } catch (e) {
      log("Attachment Error" + e.toString());
      throw ServerException();
    }
  }

  Future<File> _changeFileNameOnly(File file, String newFileName) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var extentionSeprator = path.lastIndexOf(".");
    final fileExtention = path.substring(extentionSeprator, path.length);
    var newPath =
        path.substring(0, lastSeparator + 1) + newFileName + fileExtention;
    return file.rename(newPath);
  }

  Future<File> _moveToDirectory(File file, String directory) async {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);

    final fileNameWithExtention =
        path.substring(lastSeparator + 1, path.length);
    var newPath = directory + fileNameWithExtention;
    final copiedFile = await file.copy(newPath);
    await file.delete();
    log("file copied to path :" + copiedFile.path);
    return copiedFile;
  }

  Future<void> _createUserDirectoryIfExists(String path) async {
    final directory = Directory(path);
    final isPathExistence = await directory.exists();
    if (!isPathExistence) {
      await directory.create(recursive: true);
      log("directory created");
    }
  }
}
