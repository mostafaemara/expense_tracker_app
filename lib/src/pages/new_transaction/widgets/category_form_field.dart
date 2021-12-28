import 'package:expense_tracker_app/src/bloc/categories/categories_cubit.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFormField extends StatelessWidget {
  const CategoryFormField({
    Key? key,
    required this.selectedCategoryId,
    required this.onChanged,
  }) : super(key: key);

  final String? selectedCategoryId;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    final categories = _readCategories(context);
    return DropdownButtonFormField<String>(
        onChanged: onChanged,
        hint: Text(AppLocalizations.of(context)!.category),
        value: selectedCategoryId,
        items: List.generate(
            categories.length,
            (index) => DropdownMenuItem(
                  child: Text(categories[index].title.english),
                  value: categories[index].id,
                )));
  }

  List<Category> _readCategories(BuildContext context) {
    final transactionType = context.read<TransactionFormType>();
    final categoriesState = context.read<CategoriesCubit>().state;
    return transactionType == TransactionFormType.income
        ? categoriesState.incomeCategories
        : categoriesState.expenseCategories;
  }
}
