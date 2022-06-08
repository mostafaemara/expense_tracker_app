import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountFormField extends StatelessWidget {
  const AccountFormField({
    Key? key,
    this.onChanged,
    this.selectedAccount,
    required this.accounts,
    this.targetAccountId,
  }) : super(key: key);
  final Function(String?)? onChanged;
  final String? selectedAccount;
  final List<Account> accounts;
  final String? targetAccountId;
  @override
  Widget build(BuildContext context) {
    var filteredAccounts = [...accounts];
    filteredAccounts.removeWhere((element) => element.id == targetAccountId);
    return DropdownButtonFormField<String>(
      onChanged: onChanged,
      hint: Text(AppLocalizations.of(context)!.accountName),
      value: selectedAccount,
      items: List.generate(
          filteredAccounts.length,
          (index) => DropdownMenuItem(
                child: Text(filteredAccounts[index].title),
                value: filteredAccounts[index].id,
              )),
    );
  }
}
