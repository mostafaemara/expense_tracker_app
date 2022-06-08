import 'package:expense_tracker_app/src/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmPasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  const ConfirmPasswordFormField(
      {Key? key, required this.controller, required this.passwordController})
      : super(key: key);

  @override
  State<ConfirmPasswordFormField> createState() =>
      _ConfirmPasswordFormFieldState();
}

class _ConfirmPasswordFormFieldState extends State<ConfirmPasswordFormField> {
  bool _isConfirmPasswordObscure = true;

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          confirmPasswordValidator(value!, widget.passwordController.value.text)
              ?.translate(context),
      controller: widget.controller,
      obscureText: _isConfirmPasswordObscure,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: _toggleConfirmPasswordVisibility,
              icon: Icon(_isConfirmPasswordObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined)),
          hintText: AppLocalizations.of(context)!.formFiledHintConfirmPassword),
    );
  }
}
