import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);
  final spacing = const SizedBox(
    height: 24,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.formFiledHintName),
        ),
        spacing,
        TextFormField(
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.formFiledHintEmail),
        ),
        spacing,
        TextFormField(
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.formFiledHintPassword),
        ),
        spacing,
        TextFormField(
          decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context)!.formFiledHintConfirmPassword),
        ),
        spacing,
        CheckboxListTile(
          checkColor: Theme.of(context).colorScheme.primary,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Theme.of(context).colorScheme.surface,
          title: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColors.violet),
                      text: AppLocalizations.of(context)!.formCheckBoxTitle2),
                ],
                text: AppLocalizations.of(context)!.formCheckBoxTitle1 + " "),
          ),
          value: true,
          onChanged: (value) {},
        ),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.signUp),
          ),
        ),
      ],
    );
  }
}
