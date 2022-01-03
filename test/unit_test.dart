// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Plus Operator', () {
    test('should add two numbers together', () async {
      final file =
          await changeFileNameOnly(File("sasa/masasa/sasa.png"), "mostafa");
      print(file.path);
    });
  });
}

Future<File> changeFileNameOnly(File file, String newFileName) {
  var path = file.path;
  var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  var extentionSeprator = path.lastIndexOf(".");
  final fileExtention = path.substring(extentionSeprator, path.length);
  var newPath =
      path.substring(0, lastSeparator + 1) + newFileName + fileExtention;
  return file.rename(newPath);
}
