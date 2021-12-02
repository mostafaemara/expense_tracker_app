import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/presentation/pages/account_all_set/account_all_set_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/add_new_account/add_new_account_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/login/login_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/main/budget/budget_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/main/home/home_page.dart';

import 'package:expense_tracker_app/src/presentation/pages/main/main_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/main/profile/profile_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/main/transaction/transaction_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/new_transaction/new_transaction_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/notification/notification_page.dart';

import 'package:expense_tracker_app/src/presentation/pages/onboarding/onboarding_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/rest_password/rest_password_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/setup_account/setup_account_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/signup/signup_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashPage,
    ),
    AutoRoute(
      page: OnBoardingPage,
    ),
    AutoRoute(page: SignupPage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RestPasswordPage),
    AutoRoute(
      page: SetupAccountPage,
    ),
    AutoRoute(
      page: AddNewAccountPage,
    ),
    AutoRoute(
      page: AccountAllSetPage,
    ),
    AutoRoute(
      page: NewTransactionPage,
    ),
    AutoRoute(
      page: NotificationPage,
    ),
    AutoRoute(page: MainPage, path: "/", initial: true, children: [
      AutoRoute(path: "home", initial: true, page: HomePage),
      AutoRoute(path: "transaction", page: TransactionPage),
      AutoRoute(path: "budget", page: BudgetPage),
      AutoRoute(path: "profile", page: ProfilePage),
    ])
  ],
)
class AppRouter extends _$AppRouter {}
