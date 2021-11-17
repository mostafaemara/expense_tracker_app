import 'package:flutter/material.dart';

import 'widgets/intro.dart';
import 'widgets/login_button.dart';
import 'widgets/signup_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              SizedBox(
                height: 76,
              ),
              Expanded(
                child: Intro(),
              ),
              SizedBox(
                height: 33,
              ),
              SignupButton(),
              SizedBox(
                height: 16,
              ),
              LoginButton(),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
