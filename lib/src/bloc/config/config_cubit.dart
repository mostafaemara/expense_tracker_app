import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/currency.dart';
import 'package:expense_tracker_app/src/data/models/language.dart';
import 'package:expense_tracker_app/src/data/repositories/config_repository.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(ConfigState.init());
  final _configRepo = locator<ConfigRepository>();
  void init() async {
    final themeMode = await _configRepo.readThemeMode();
    final language = await _configRepo.readLanguageCode();
    final currency = await _configRepo.readCurrency();

    emit(state.copyWith(
        isLoading: false,
        currency: currency ?? Currency.usd,
        language: language ?? Language.english,
        themeMode: themeMode ?? ThemeMode.system));
  }

  void selectCurrency(Currency currency) async {
    await _configRepo.writeCurrency(currency);
    emit(state.copyWith(currency: currency));
  }
}
