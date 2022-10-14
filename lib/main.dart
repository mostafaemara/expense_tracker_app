import 'dart:developer';

import 'package:expense_tracker_app/src/bloc/account_details/account_details_bloc.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';

import 'package:expense_tracker_app/src/bloc/budgets/budgets_cubit.dart';
import 'package:expense_tracker_app/src/bloc/config/config_cubit.dart';
import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_bloc.dart';
import 'package:expense_tracker_app/src/bloc/home/home_cubit.dart';
import 'package:expense_tracker_app/src/bloc/login/login_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_budget/new_budget_cubit.dart';
import 'package:expense_tracker_app/src/bloc/profile/profile_cubit.dart';
import 'package:expense_tracker_app/src/bloc/signup/signup_cubit.dart';
import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/manger/notification_manger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'injection.dart';
import 'src/app.dart';
import 'src/bloc/transaction_details/transaction_details_cubit.dart';

final NotificationManger notificationManger = NotificationManger(
  (p0) {},
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();

  await notificationManger.init();
  final token = await FirebaseMessaging.instance.getToken();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  log(token.toString() + "   Token");
  // FirebaseMessaging.onBackgroundMessage((message) async {
  //   if (message.notification != null) {
  //     log("message Recived" + message.notification.toString());
  //     await notificationManger.showNotification(DateTime.now().microsecond,
  //         message.notification!.title!, message.notification!.body!);
  //   }
  // });
  FirebaseMessaging.onMessageOpenedApp.listen((event) async {
    log("message Recived");
    if (event.notification != null) {
      await notificationManger.showNotification(DateTime.now().microsecond,
          event.notification!.title!, event.notification!.body!);
    }
  });
  FirebaseMessaging.onMessage.listen((event) async {
    log("message Recived");
    if (event.notification != null) {
      await notificationManger.showNotification(DateTime.now().microsecond,
          event.notification!.title!, event.notification!.body!);
    }
  });

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        lazy: false,
        create: (context) => ConfigCubit()..init(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => TransactionCubit()..init(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => ProfileCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => SignupCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => HomeCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => FinancialReportCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => BudgetsCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => AccountsCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => AccountDetailsCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => ProfileCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => NewBudgetCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => TransactionDetailsCubit(),
      )
    ], child: MyApp()),
  );
}
