import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'intro_page.dart';

class Intro extends StatelessWidget {
  const Intro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showNextButton: false,
      showSkipButton: false,
      showDoneButton: false, controlsMargin: EdgeInsets.zero,
      controlsPadding: EdgeInsets.zero,

      dotsDecorator: DotsDecorator(
          activeSize: const Size(16, 16),
          color: Theme.of(context).colorScheme.secondary,
          activeColor: Theme.of(context).colorScheme.primary),

      rawPages: [
        IntroPage(
          title: AppLocalizations.of(context)!.onBoardingTitle1,
          body: AppLocalizations.of(context)!.onBoardingBody1,
          image: Image.asset(
            "assets/images/gain_total_control.png",
          ),
        ),
        IntroPage(
          title: AppLocalizations.of(context)!.onBoardingTitle2,
          body: AppLocalizations.of(context)!.onBoardingBody2,
          image: Image.asset(
            "assets/images/know_where_your_money_goes.png",
          ),
        ),
        IntroPage(
          title: AppLocalizations.of(context)!.onBoardingTitle3,
          body: AppLocalizations.of(context)!.onBoardingBody3,
          image: Image.asset(
            "assets/images/planning_ahead.png",
          ),
        ),
      ],
      // pages: [
      //   PageViewModel(
      //       decoration: _pageDecoration,
      //       useScrollView: false,
      //       image: Image.asset(
      //         "assets/images/gain_total_control.png",
      //       ),
      //       title: AppLocalizations.of(context)!.onBoardingTitle1,
      //       body: AppLocalizations.of(context)!.onBoardingBody1),
      //   PageViewModel(
      //       decoration: _pageDecoration,
      //       useScrollView: false,
      //       image: Image.asset(
      //         "assets/images/know_where_your_money_goes.png",
      //       ),
      //       title: AppLocalizations.of(context)!.onBoardingTitle2,
      //       body: AppLocalizations.of(context)!.onBoardingBody2),
      //   PageViewModel(
      //       decoration: _pageDecoration,
      //       useScrollView: false,
      //       image: Image.asset(
      //         "assets/images/planning_ahead.png",
      //       ),
      //       title: AppLocalizations.of(context)!.onBoardingTitle3,
      //       body: AppLocalizations.of(context)!.onBoardingBody3),
      // ],
    );
  }
}
