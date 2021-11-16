import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  void goToOnBoarding(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    context.navigateTo(const OnBoardingRoute());
  }

  @override
  Widget build(BuildContext context) {
    goToOnBoarding(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:
          Center(child: Image.asset("assets/images/expense_tracker_logo.png")),
    );
  }
}
