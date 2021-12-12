import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            alignment: AlignmentDirectional.centerStart),
        onPressed: () => context.navigateTo(const RestPasswordRoute()),
        child: Text(AppLocalizations.of(context)!.forgotPassword));
  }
}
