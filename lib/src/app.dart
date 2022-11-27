import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/config/config_cubit.dart';
import 'package:expense_tracker_app/src/data/models/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routes/app_router.dart';
import 'styles/app_themes.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  final _appRouter = locator<AppRouter>();
  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigCubit>();
    return MaterialApp.router(
      // restorationScopeId: 'Expense_Tracker:SgVkYp3s6v8y/B?E(H+MbQeThWmZq4t7',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: config.state.themeMode,
      locale: Locale(config.state.language.langCode),
      supportedLocales: List.generate(
          Language.values.length, (index) => Language.values[index].locale()),
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData.dark(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
