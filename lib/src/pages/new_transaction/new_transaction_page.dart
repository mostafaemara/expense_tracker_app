import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'widgets/add_new_transfer_form.dart';
import 'widgets/new_expense_form.dart';

class NewTransactionPage extends StatelessWidget {
  final TransactionFormType transactionType;
  const NewTransactionPage({Key? key, required this.transactionType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              titleTextStyle: theme.appBarTheme.titleTextStyle!
                  .copyWith(color: theme.colorScheme.onPrimary))),
      child: Provider.value(
        value: transactionType,
        child: Scaffold(
          backgroundColor: _getBackgroundColor(),
          appBar: MyAppBar(title: _getPageTitle(context)),
          body: _getForm(),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (transactionType) {
      case TransactionFormType.expense:
        return AppColors.red;

      case TransactionFormType.income:
        return AppColors.green;

      case TransactionFormType.transfer:
        return AppColors.blue;
    }
  }

  String _getPageTitle(BuildContext context) {
    switch (transactionType) {
      case TransactionFormType.expense:
        return AppLocalizations.of(context)!.expense;

      case TransactionFormType.income:
        return AppLocalizations.of(context)!.income;

      case TransactionFormType.transfer:
        return AppLocalizations.of(context)!.transfer;
    }
  }

  Widget _getForm() {
    switch (transactionType) {
      case TransactionFormType.expense:
        return const NewExpenseForm();

      case TransactionFormType.income:
        return const NewExpenseForm();

      case TransactionFormType.transfer:
        return const AddNewTransformForm();
    }
  }
}
