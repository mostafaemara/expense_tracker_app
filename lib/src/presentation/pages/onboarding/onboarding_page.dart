import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageDecoration = PageDecoration(
      imagePadding: EdgeInsets.zero,
      contentMargin: const EdgeInsets.only(top: 60),
      titleTextStyle: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(fontWeight: FontWeight.bold, color: AppColors.dark),
      bodyTextStyle: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: AppColors.light20),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 76,
              ),
              Expanded(
                child: IntroductionScreen(
                  controlsPadding: EdgeInsets.zero,
                  showNextButton: false,
                  showSkipButton: false,
                  showDoneButton: false,
                  dotsDecorator: DotsDecorator(
                      activeSize: const Size(16, 16),
                      color: Theme.of(context).colorScheme.secondary,
                      activeColor: Theme.of(context).colorScheme.primary),
                  isTopSafeArea: true,
                  pages: [
                    PageViewModel(
                        decoration: _pageDecoration,
                        useScrollView: false,
                        image: Image.asset(
                          "assets/images/gain_total_control.png",
                        ),
                        title: AppLocalizations.of(context)!.onBoardingTitle1,
                        body: AppLocalizations.of(context)!.onBoardingBody1),
                    PageViewModel(
                        decoration: _pageDecoration,
                        useScrollView: false,
                        image: Image.asset(
                          "assets/images/know_where_your_money_goes.png",
                        ),
                        title: AppLocalizations.of(context)!.onBoardingTitle2,
                        body: AppLocalizations.of(context)!.onBoardingBody2),
                    PageViewModel(
                        decoration: _pageDecoration,
                        useScrollView: false,
                        image: Image.asset(
                          "assets/images/planning_ahead.png",
                        ),
                        title: AppLocalizations.of(context)!.onBoardingTitle3,
                        body: AppLocalizations.of(context)!.onBoardingBody3),
                  ],
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.signUp)),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary,
                        onPrimary: Theme.of(context).colorScheme.onSecondary),
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.login)),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
