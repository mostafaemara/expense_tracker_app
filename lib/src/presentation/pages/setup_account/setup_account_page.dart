import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetupAccountPage extends StatelessWidget {
  const SetupAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 67,
              ),
              Text(
                AppLocalizations.of(context)!.setupAccountTitle,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(
                height: 37,
              ),
              Text(
                AppLocalizations.of(context)!.setupAccountBody,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const Spacer(),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.letsGo),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
