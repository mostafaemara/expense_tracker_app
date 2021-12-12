import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckboxTile extends StatelessWidget {
  const CheckboxTile({
    Key? key,
    required this.handleCheckbox,
    required this.value,
  }) : super(key: key);
  final void Function(bool?) handleCheckbox;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
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
      value: value,
      onChanged: handleCheckbox,
    );
  }
}
