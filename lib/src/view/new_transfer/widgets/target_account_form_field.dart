import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/new_transaction/newtransaction_cubit.dart';
import '../../../bloc/new_transaction/newtransaction_state.dart';

class TargetAccountFormField extends StatelessWidget {
  const TargetAccountFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newTransactionCubit = context.read<NewTransactionCubit>();

    return BlocBuilder<NewTransactionCubit, NewTransactionState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) => DropdownButtonFormField<String>(
          onChanged: newTransactionCubit.selectTargetAccount,
          hint: const Text("To"),
          value: state.selectedAccount,
          items: List.generate(
              state.targetAccounts.length,
              (index) => DropdownMenuItem(
                    child: Text(state.targetAccounts[index].title),
                    value: state.targetAccounts[index].id,
                  ))),
    );
  }
}
