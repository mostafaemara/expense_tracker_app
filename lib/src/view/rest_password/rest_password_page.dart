import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/rest_password_form.dart';

class RestPasswordPage extends StatelessWidget {
  const RestPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.restPasswordTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: const [
              SizedBox(
                height: 56,
              ),
              RestPasswordForm()
            ],
          ),
        ));
  }
}
