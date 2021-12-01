import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../widgets/balance_text_field.dart';

class NewExpenseForm extends StatelessWidget {
  const NewExpenseForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BalanceFormField(
            title: AppLocalizations.of(context)!.howMuch,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: Column(
            children: [
              DropdownButtonFormField(
                  hint: Text(AppLocalizations.of(context)!.category),
                  items: [
                    DropdownMenuItem(
                        value: "bank",
                        child: Text(AppLocalizations.of(context)!.bankAccount)),
                    DropdownMenuItem(
                        value: "wallet",
                        child: Text(AppLocalizations.of(context)!.wallet))
                  ]),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.description),
              ),
              const SizedBox(
                height: 16,
              ),
              DropdownButtonFormField(
                  hint: Text(AppLocalizations.of(context)!.wallet),
                  items: [
                    DropdownMenuItem(
                        value: "bank",
                        child: Text(AppLocalizations.of(context)!.bankAccount)),
                    DropdownMenuItem(
                        value: "wallet",
                        child: Text(AppLocalizations.of(context)!.wallet))
                  ]),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Transform.rotate(
                    angle: 180,
                    child: const Icon(Icons.attach_file),
                  ),
                  label: Text(AppLocalizations.of(context)!.addAttachment),
                ),
              ),
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
