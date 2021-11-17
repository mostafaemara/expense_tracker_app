import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/presentation/pages/login/login_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/onboarding/onboarding_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/signup/signup_page.dart';
import 'package:expense_tracker_app/src/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: "Page,Route", routes: <AutoRoute>[
  AutoRoute(page: SplashPage, initial: true),
  AutoRoute(
    page: OnBoardingPage,
  ),
  AutoRoute(page: SignupPage),
  AutoRoute(page: LoginPage)
])
class AppRouter extends _$AppRouter {}
