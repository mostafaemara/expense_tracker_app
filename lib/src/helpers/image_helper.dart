import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

import 'dart:convert';

extension ImagePickerHelper on XFile {
  Future<String> convertToBase64Image() async {
    final imageBytes = await readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }
}

extension StringToImageConverter on String {
  Uint8List base64ToImage() {
    return base64Decode(this);
  }
}
