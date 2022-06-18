import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/email.png"),
        const SizedBox(
          height: 18,
        ),
        Text(AppLocalizations.of(context)!.emailSent,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 24,
        ),
        Text(
          AppLocalizations.of(context)!.checkYourEmail,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: 190,
        ),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.replaceRoute(const LoginRoute());
            },
            child: Text(AppLocalizations.of(context)!.backToLgin),
          ),
        ),
      ],
    );
  }
}
