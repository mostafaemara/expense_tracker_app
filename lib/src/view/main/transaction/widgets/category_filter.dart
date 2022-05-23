import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionsBloc = context.watch<TransactionCubit>();
    final selectedCategories = transactionsBloc.state.selectedCategories;
    return GestureDetector(
      onTap: () => _showMultiSelect(context),
      child: Row(
        children: [
          const Text("Choose Category"),
          const Spacer(),
          Text(selectedCategories == null || selectedCategories.isEmpty
              ? "0 Selected"
              : selectedCategories.length.toString()),
          RotatedBox(
              quarterTurns:
                  Directionality.of(context) == TextDirection.rtl ? 0 : 2,
              child: const Icon(Icons.arrow_back_ios))
        ],
      ),
    );
  }

  void _showMultiSelect(BuildContext context) async {
    final transactionsBloc = context.read<TransactionCubit>();
    final categories = transactionsBloc.state.categories;
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog<String>(
          items: List.generate(
              categories.length,
              (index) => MultiSelectItem(
                  categories[index].id, categories[index].title)),
          initialValue: const [],
          onConfirm: (values) {
            transactionsBloc.selectCategories(values);
          },
        );
      },
    );
  }
}
