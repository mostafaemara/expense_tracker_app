import 'package:expense_tracker_app/src/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountNameFormField extends StatelessWidget {
  const AccountNameFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => formFieldValidator(value!) != null
          ? AppLocalizations.of(context)!.enterField
          : null,
      decoration:
          InputDecoration(hintText: AppLocalizations.of(context)!.accountName),
    );
  }
}
