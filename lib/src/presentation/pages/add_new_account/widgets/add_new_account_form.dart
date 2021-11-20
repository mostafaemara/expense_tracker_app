import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'balance_text_field.dart';

class AddNewAccountForm extends StatelessWidget {
  const AddNewAccountForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BalanceFormField(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.accountName),
              ),
              const SizedBox(
                height: 16,
              ),
              DropdownButtonFormField(
                  hint: Text(AppLocalizations.of(context)!.accountType),
                  items: [
                    DropdownMenuItem(
                        value: "bank",
                        child: Text(AppLocalizations.of(context)!.bankAccount)),
                    DropdownMenuItem(
                        value: "wallet",
                        child: Text(AppLocalizations.of(context)!.wallet))
                  ]),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child:
                      Text(AppLocalizations.of(context)!.continueButtonTitle),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        )
      ],
    );
  }
}
