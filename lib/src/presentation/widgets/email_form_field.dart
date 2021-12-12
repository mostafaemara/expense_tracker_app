import 'package:expense_tracker_app/src/domain/validators/auth_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "./../helpers/validation_failure_translator.dart";

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  const EmailFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => emailValidator(value!)?.toLocaleString(context),
      controller: controller,
      decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.formFiledHintEmail),
    );
  }
}
