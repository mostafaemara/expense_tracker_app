import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/presentation/pages/account_all_set/account_all_set_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/add_new_account/add_new_account_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/login/login_page.dart';
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
    AutoRoute(page: AccountAllSetPage, initial: true)
  ],
)
class AppRouter extends _$AppRouter {}
