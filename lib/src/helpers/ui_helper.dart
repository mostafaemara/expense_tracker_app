import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension UiHelper on BuildContext {
  showSnackBar(String content, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: backgroundColor,
    ));
  }

  AppLocalizations get t => AppLocalizations.of(this)!;
}
