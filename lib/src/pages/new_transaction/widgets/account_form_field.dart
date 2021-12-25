import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountFormField extends StatelessWidget {
  const AccountFormField({
    Key? key,
    required this.selectedAccountId,
    required this.onChanged,
  }) : super(key: key);

  final String? selectedAccountId;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    final accounts = context.read<AccountsCubit>().state.accounts;
    return DropdownButtonFormField<String>(
        onChanged: onChanged,
        hint: Text(AppLocalizations.of(context)!.accountName),
        value: selectedAccountId,
        items: List.generate(
            accounts.length,
            (index) => DropdownMenuItem(
                  child: Text(accounts[index].title),
                  value: accounts[index].id,
                )));
  }
}
