import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.dontHaveAnAccount,
          style: TextStyle(
              color: Theme.of(context).inputDecorationTheme.hintStyle!.color!),
        ),
        TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsetsDirectional.only(start: 3),
                alignment: AlignmentDirectional.centerStart),
            onPressed: () => context.replaceRoute(const SignupRoute()),
            child: Text(AppLocalizations.of(context)!.signUp)),
      ],
    );
  }
}
