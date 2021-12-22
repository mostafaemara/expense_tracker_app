import 'package:expense_tracker_app/src/models/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../widgets/balance_text_field.dart';

class AddNewAccountForm extends StatefulWidget {
  const AddNewAccountForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewAccountForm> createState() => _AddNewAccountFormState();
}

class _AddNewAccountFormState extends State<AddNewAccountForm> {
  final _balanceController = TextEditingController();
  final _accountNameController = TextEditingController();
  AccountType? _selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BalanceFormField(
            title: AppLocalizations.of(context)!.balance,
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
              TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.accountName),
              ),
              const SizedBox(
                height: 16,
              ),
              SelectAccountFormField(
                selectedType: _selectedAccountType,
                onChanged: _handleSelectAccount,
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

  void _handleSelectAccount(AccountType? type) {
    if (type == null) {
      return;
    }
    setState(() {
      _selectedAccountType = type;
    });
  }
}

class SelectAccountFormField extends StatelessWidget {
  const SelectAccountFormField({
    Key? key,
    required this.selectedType,
    required this.onChanged,
  }) : super(key: key);
  final AccountType? selectedType;
  final void Function(AccountType?) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: selectedType,
        onChanged: onChanged,
        hint: Text(AppLocalizations.of(context)!.accountType),
        items: [
          DropdownMenuItem(
              value: AccountType.bankAccount,
              child: Text(AppLocalizations.of(context)!.bankAccount)),
          DropdownMenuItem(
              value: AccountType.wallet,
              child: Text(AppLocalizations.of(context)!.wallet))
        ]);
  }
}
