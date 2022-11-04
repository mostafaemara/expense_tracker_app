import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/currency.dart';
import 'package:expense_tracker_app/src/data/models/language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ConfigRepository {
  final SharedPreferences _db = locator.get<SharedPreferences>();
  final _languageKey = "languageCode";
  final _themeModeKey = "themeMode";
  final _currencyKey = "currency";
  Future<Language?> readLanguageCode() async {
    final languageCode = _db.getString(_languageKey);
    if (languageCode == null) {
      return null;
    }
    return Language.parse(languageCode);
  }

  Future<void> writeLanguageCode(Language language) async =>
      await _db.setString(_languageKey, language.langCode);

  Future<ThemeMode?> readThemeMode() async {
    final themeValue = _db.getString(_themeModeKey);
    if (themeValue == null) {
      return null;
    } else {
      return _parseThemeMode(themeValue);
    }
  }

  Future<void> writeThemeMode(ThemeMode mode) =>
      _db.setString(_themeModeKey, mode.name);

  Future<Currency?> readCurrency() async {
    final currencyValue = _db.getString(_currencyKey);
    if (currencyValue == null) {
      return null;
    }
    return Currency.parse(currencyValue);
  }

  Future<void> writeCurrency(Currency currency) async =>
      _db.setString(_currencyKey, currency.code);
  Future<AppLocalizations> loadAppLocalizations() async {
    final configRepo = locator<ConfigRepository>();

    final lang = await configRepo.readLanguageCode();
    final locale = lang == null
        ? Locale(Language.english.langCode)
        : Locale(lang.langCode);
    return await AppLocalizations.delegate.load(locale);
  }
}

extension ThemeModeMapper on ThemeMode {
  String get name {
    switch (this) {
      case ThemeMode.system:
        return "system";

      case ThemeMode.light:
        return "light";
      case ThemeMode.dark:
        return "dark";
    }
  }
}

ThemeMode _parseThemeMode(String value) {
  switch (value) {
    case "system":
      return ThemeMode.system;
    case "light":
      return ThemeMode.light;
    case "dark":
      return ThemeMode.dark;
    default:
      throw const FormatException("Invalid Theme Mode value");
  }
}
