import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountAllSetPage extends StatelessWidget {
  const AccountAllSetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/success.png"),
            const SizedBox(
              height: 16,
            ),
            Text(AppLocalizations.of(context)!.youAreAllSet,
                style: Theme.of(context).textTheme.headline5)
          ],
        ),
      ),
    );
  }
}
