import 'package:expense_tracker_app/src/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  const EmailFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => emailValidator(value!)?.translate(context),
      controller: controller,
      decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.formFiledHintEmail),
    );
  }
}
