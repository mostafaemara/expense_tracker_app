import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_state.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFormField extends StatelessWidget {
  const CategoryFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newTransactionCubit = context.read<NewTransactionCubit>();

    return BlocBuilder<NewTransactionCubit, NewTransactionState>(
      buildWhen: (previous, current) =>
          current.selectedCategory != previous.selectedCategory,
      builder: (context, state) => DropdownButtonFormField<Category>(
          onChanged: newTransactionCubit.selectCategory,
          hint: Text(AppLocalizations.of(context)!.category),
          value: state.selectedCategory,
          items: List.generate(
              state.categories.length,
              (index) => DropdownMenuItem(
                    child: Text(state.categories[index].title),
                    value: state.categories[index],
                  ))),
    );
  }
}
