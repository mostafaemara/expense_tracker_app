import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';
import 'package:expense_tracker_app/src/models/category.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFormField extends StatelessWidget {
  const CategoryFormField({
    Key? key,
    required this.selectedCategory,
    required this.onChanged,
  }) : super(key: key);

  final Category? selectedCategory;
  final void Function(Category?) onChanged;

  @override
  Widget build(BuildContext context) {
    final categories = context.read<NewTransactionCubit>().state.categories;

    return DropdownButtonFormField<Category>(
        onChanged: onChanged,
        hint: Text(AppLocalizations.of(context)!.category),
        value: selectedCategory,
        items: List.generate(
            categories.length,
            (index) => DropdownMenuItem(
                  child: Text(categories[index].title.english),
                  value: categories[index],
                )));
  }
}
