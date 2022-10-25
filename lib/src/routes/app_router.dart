import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/data/models/budget.dart';
import 'package:expense_tracker_app/src/data/models/financial_report.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

import 'package:expense_tracker_app/src/view/account_all_set/account_all_set_page.dart';
import 'package:expense_tracker_app/src/view/accounts/accounts_page.dart';
import 'package:expense_tracker_app/src/view/acount_details/account_details_page.dart';
import 'package:expense_tracker_app/src/view/add_new_account/add_new_account_page.dart';
import 'package:expense_tracker_app/src/view/budget/budget_page.dart';
import 'package:expense_tracker_app/src/view/budget_details/budget_details_page.dart';
import 'package:expense_tracker_app/src/view/financial_details/financial_details_page.dart';
import 'package:expense_tracker_app/src/view/financial_report/financial.report_page.dart';
import 'package:expense_tracker_app/src/view/home/home_page.dart';

import 'package:expense_tracker_app/src/view/login/login_page.dart';

import 'package:expense_tracker_app/src/view/main_page.dart';
import 'package:expense_tracker_app/src/view/new_budget/new_budget_page.dart';

import 'package:expense_tracker_app/src/view/new_transaction/new_transaction_page.dart';
import 'package:expense_tracker_app/src/view/new_transfer/new_transfer_page.dart';
import 'package:expense_tracker_app/src/view/notification/notification_page.dart';
import 'package:expense_tracker_app/src/view/onboarding/onboarding_page.dart';
import 'package:expense_tracker_app/src/view/profile/edite_profile_screen.dart.dart';
import 'package:expense_tracker_app/src/view/profile/profile_page.dart';
import 'package:expense_tracker_app/src/view/rest_password/rest_password_page.dart';
import 'package:expense_tracker_app/src/view/settings/about_page.dart';
import 'package:expense_tracker_app/src/view/settings/currency_page.dart';
import 'package:expense_tracker_app/src/view/settings/language_page.dart';
import 'package:expense_tracker_app/src/view/settings/settings_page.dart';
import 'package:expense_tracker_app/src/view/settings/theme_page.dart';
import 'package:expense_tracker_app/src/view/setup_account/setup_account_page.dart';
import 'package:expense_tracker_app/src/view/signup/signup_page.dart';
import 'package:expense_tracker_app/src/view/splash/splash_page.dart';
import 'package:expense_tracker_app/src/view/transaction/transaction_page.dart';
import 'package:expense_tracker_app/src/view/transaction_details/transaction_details.dart';

import 'package:flutter/material.dart';

import '../data/models/user.dart';

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
    AutoRoute(
      page: FinancialReportPage,
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
    AutoRoute(
      page: FinancialDetailsPage,
    ),
    AutoRoute(
      page: NewBudgetPage,
    ),
    AutoRoute(
      page: AccountsPage,
    ),
    AutoRoute(
      page: AccountDetailsPage,
    ),
    AutoRoute(
      page: BudgetDetailsPage,
    ),
    AutoRoute(
      page: SettingsPage,
    ),
    AutoRoute(
      page: AboutPage,
    ),
    AutoRoute(
      page: CurrencyPage,
    ),
    AutoRoute(
      page: LanguagePage,
    ),
    AutoRoute(
      page: ThemePage,
    ),
    AutoRoute(
      page: EditeProfilePage,
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
