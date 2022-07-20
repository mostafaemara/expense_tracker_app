import 'package:flutter/material.dart';

extension UiHelper on BuildContext {
  showSnackBar(String content, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: backgroundColor,
    ));
  }
}
