import 'package:expense_tracker_app/src/data/models/multilingual.dart';
import 'package:flutter/material.dart';

extension MultilingualHelper on Multilingual {
  String translate(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == "ar") {
      return arabic;
    } else {
      return english;
    }
  }
}
