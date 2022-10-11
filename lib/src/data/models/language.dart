import 'package:flutter/material.dart';

enum Language {
  english("en", "English"),
  arabic("ar", "العربية");

  final String langCode;
  final String title;
  const Language(this.langCode, this.title);

  factory Language.parse(String value) {
    switch (value) {
      case "en":
        return Language.english;
      case "ar":
        return Language.arabic;
      default:
        throw const FormatException("invalid language value");
    }
  }

  Locale locale() => Locale(langCode);
}
