import 'package:expense_tracker_app/src/data/models/currency.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker_app/src/data/models/language.dart';

class ConfigState {
  final bool isLoading;
  final Currency currency;
  final Language language;
  final ThemeMode themeMode;

  const ConfigState(
      this.currency, this.language, this.themeMode, this.isLoading);
  ConfigState.init()
      : currency = Currency.usd,
        isLoading = true,
        language = Language.english,
        themeMode = ThemeMode.system;
  ConfigState copyWith({
    Currency? currency,
    Language? language,
    ThemeMode? themeMode,
    bool? isLoading,
  }) {
    return ConfigState(currency ?? this.currency, language ?? this.language,
        themeMode ?? this.themeMode, isLoading ?? this.isLoading);
  }
}
