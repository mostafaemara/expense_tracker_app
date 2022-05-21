import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'package:expense_tracker_app/src/view/account_all_set/account_all_set_page.dart';
import 'package:expense_tracker_app/src/view/add_new_account/add_new_account_page.dart';
import 'package:expense_tracker_app/src/view/login/login_page.dart';
import 'package:expense_tracker_app/src/view/main/budget/budget_page.dart';
import 'package:expense_tracker_app/src/view/main/home/home_page.dart';
import 'package:expense_tracker_app/src/view/main/main_page.dart';
import 'package:expense_tracker_app/src/view/main/profile/profile_page.dart';
import 'package:expense_tracker_app/src/view/main/transaction/transaction_page.dart';
import 'package:expense_tracker_app/src/view/new_transaction/new_transaction_page.dart';
import 'package:expense_tracker_app/src/view/new_transfer/new_transfer_page.dart';
import 'package:expense_tracker_app/src/view/notification/notification_page.dart';
import 'package:expense_tracker_app/src/view/onboarding/onboarding_page.dart';
import 'package:expense_tracker_app/src/view/rest_password/rest_password_page.dart';
import 'package:expense_tracker_app/src/view/setup_account/setup_account_page.dart';
import 'package:expense_tracker_app/src/view/signup/signup_page.dart';
import 'package:expense_tracker_app/src/view/splash/splash_page.dart';
import 'package:expense_tracker_app/src/view/transaction_details/transaction_details.dart';

import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: SplashPage,
    ),
    AutoRoute(
      page: OnBoardingPage,
    ),
    AutoRoute(page: SignupPage),
    AutoRoute(page: TransactionDetailsPage),
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
      page: NewTransferPage,
    ),
    AutoRoute(
      page: NotificationPage,
    ),
    AutoRoute(page: MainPage, path: "/", children: [
      AutoRoute(path: "home", initial: true, page: HomePage),
      AutoRoute(path: "transaction", page: TransactionPage),
      AutoRoute(path: "budget", page: BudgetPage),
      AutoRoute(path: "profile", page: ProfilePage),
    ])
  ],
)
class AppRouter extends _$AppRouter {}
