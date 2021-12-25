import 'package:expense_tracker_app/src/pages/main/main_page.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

class AccountAllSetPage extends StatelessWidget {
  const AccountAllSetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _gotoHomePage(context);
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

  void _gotoHomePage(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2),
        () => context.navigateTo(const MainRoute()));
  }
}
