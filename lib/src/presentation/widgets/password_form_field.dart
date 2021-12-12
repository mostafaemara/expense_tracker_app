import 'package:expense_tracker_app/src/domain/validators/auth_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "./../helpers/validation_failure_translator.dart";

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isPasswordObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => passwordValidator(value!)?.toLocaleString(context),
      controller: widget.controller,
      obscureText: _isPasswordObscure,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: _togglePasswordVisibility,
              icon: Icon(_isPasswordObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined)),
          hintText: AppLocalizations.of(context)!.formFiledHintPassword),
    );
  }
}
