import 'package:expense_tracker_app/src/models/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectAccountTypeFormField extends StatelessWidget {
  const SelectAccountTypeFormField({
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
