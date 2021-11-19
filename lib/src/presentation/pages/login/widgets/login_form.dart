import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final spacing = const SizedBox(
    height: 24,
  );

  final double formTextFieldHight = 56;
  bool _isPasswordObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: formTextFieldHight,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.formFiledHintEmail),
          ),
        ),
        spacing,
        SizedBox(
          height: formTextFieldHight,
          child: TextFormField(
            obscureText: _isPasswordObscure,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(_isPasswordObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined)),
                hintText: AppLocalizations.of(context)!.formFiledHintPassword),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.login),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          AppLocalizations.of(context)!.orWith,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Theme.of(context).inputDecorationTheme.hintStyle!.color!),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                side: BorderSide(
                    color: Theme.of(context)
                        .inputDecorationTheme
                        .enabledBorder!
                        .borderSide
                        .color),
                elevation: 0,
                onPrimary: Theme.of(context).colorScheme.onBackground,
                primary: Theme.of(context).colorScheme.background),
            icon: Image.asset("assets/images/google_logo.png"),
            onPressed: () {
              //TODO signup with google
            },
            label: Text(AppLocalizations.of(context)!.loginWithGoogle),
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                alignment: AlignmentDirectional.centerStart),
            onPressed: () => context.navigateTo(const RestPasswordRoute()),
            child: Text(AppLocalizations.of(context)!.forgotPassword)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.dontHaveAnAccount,
              style: TextStyle(
                  color:
                      Theme.of(context).inputDecorationTheme.hintStyle!.color!),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsetsDirectional.only(start: 3),
                    alignment: AlignmentDirectional.centerStart),
                onPressed: () => context.replaceRoute(const SignupRoute()),
                child: Text(AppLocalizations.of(context)!.signUp)),
          ],
        ),
      ],
    );
  }
}
