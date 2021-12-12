import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        onPressed: onPressed,
        label: Text(AppLocalizations.of(context)!.loginWithGoogle),
      ),
    );
  }
}
