import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountFormField extends StatelessWidget {
  const AccountFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newTransactionCubit = context.read<NewTransactionCubit>();
    return BlocBuilder<NewTransactionCubit, NewTransactionState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) => DropdownButtonFormField<String>(
          onChanged: newTransactionCubit.selectAccount,
          hint: Text(AppLocalizations.of(context)!.accountName),
          value: state.selectedAccount,
          items: List.generate(
              state.accounts.length,
              (index) => DropdownMenuItem(
                    child: Text(state.accounts[index].title),
                    value: state.accounts[index].id,
                  ))),
    );
  }
}
