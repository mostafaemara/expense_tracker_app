import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/email_sent.dart';
import 'widgets/rest_password_form.dart';

class RestPasswordPage extends StatefulWidget {
  const RestPasswordPage({Key? key}) : super(key: key);

  @override
  State<RestPasswordPage> createState() => _RestPasswordPageState();
}

class _RestPasswordPageState extends State<RestPasswordPage> {
  bool isEmailSent = false;
  void showEmailSent() {
    setState(() {
      isEmailSent = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.restPasswordTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 56,
              ),
              isEmailSent
                  ? const EmailSent()
                  : RestPasswordForm(
                      showEmailSent: showEmailSent,
                    )
            ],
          ),
        ));
  }
}
