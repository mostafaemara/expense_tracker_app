import 'dart:ui';

import 'package:expense_tracker_app/src/data/exceptions/connection_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/invalid_input_exception.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ExceptionHelper on Exception {
  Future<String> parse(Locale locale) async {
    if (this is InavlidInputException) {
      return (this as InavlidInputException).message;
    }

    final t = await AppLocalizations.delegate.load(locale);
    if (this is ConnectionException) {
      return t.noInternet;
    }
    if (this is ServerException) {
      return t.serverError;
    }
    return t.unownError;
  }
}
