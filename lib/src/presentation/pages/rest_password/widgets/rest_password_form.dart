import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RestPasswordForm extends StatefulWidget {
  final void Function()? showEmailSent;
  const RestPasswordForm({Key? key, this.showEmailSent}) : super(key: key);

  @override
  State<RestPasswordForm> createState() => _RestPasswordFormState();
}

class _RestPasswordFormState extends State<RestPasswordForm> {
  final spacing = const SizedBox(
    height: 24,
  );

  final double formTextFieldHight = 56;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.enterYourEmailToRestPassword,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 46,
        ),
        SizedBox(
          height: formTextFieldHight,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.formFiledHintEmail),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.showEmailSent,
            child: Text(AppLocalizations.of(context)!.continueButtonTitle),
          ),
        ),
      ],
    );
  }
}
