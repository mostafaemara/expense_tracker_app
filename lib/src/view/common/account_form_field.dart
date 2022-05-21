import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountFormField extends StatelessWidget {
  const AccountFormField({
    Key? key,
    this.onChanged,
    this.selectedAccount,
    required this.accounts,
  }) : super(key: key);
  final Function(String?)? onChanged;
  final String? selectedAccount;
  final List<Account> accounts;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      onChanged: onChanged,
      hint: Text(AppLocalizations.of(context)!.accountName),
      value: selectedAccount,
      items: List.generate(
          accounts.length,
          (index) => DropdownMenuItem(
                child: Text(accounts[index].title),
                value: accounts[index].id,
              )),
    );
  }
}
