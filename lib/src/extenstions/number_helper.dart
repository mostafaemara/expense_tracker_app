import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';

extension DoubleTranslator on double {
  String translate(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final arabicNumber = ArabicNumbers();
    if (locale.languageCode == "ar") {
      return arabicNumber.convert(toStringAsFixed(0));
    } else {
      return toStringAsFixed(0);
    }
  }
}
