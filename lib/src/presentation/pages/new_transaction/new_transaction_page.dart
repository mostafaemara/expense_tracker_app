import 'package:expense_tracker_app/src/presentation/pages/add_new_account/widgets/add_new_account_form.dart';
import 'package:expense_tracker_app/src/presentation/pages/new_transaction/widgets/add_new_transfer_form.dart';
import 'package:expense_tracker_app/src/presentation/pages/new_transaction/widgets/new_expense_form.dart';
import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:expense_tracker_app/src/presentation/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TransactionType { expense, income, transfer }

class NewTransactionPage extends StatelessWidget {
  final TransactionType transactionType;
  const NewTransactionPage({Key? key, required this.transactionType})
      : super(key: key);

  Color _getBackgroundColor() {
    switch (transactionType) {
      case TransactionType.expense:
        return AppColors.red;

      case TransactionType.income:
        return AppColors.green;

      case TransactionType.transfer:
        return AppColors.blue;
    }
  }

  String _getPageTitle(BuildContext context) {
    switch (transactionType) {
      case TransactionType.expense:
        return AppLocalizations.of(context)!.expense;

      case TransactionType.income:
        return AppLocalizations.of(context)!.income;

      case TransactionType.transfer:
        return AppLocalizations.of(context)!.transfer;
    }
  }

  Widget _getForm() {
    switch (transactionType) {
      case TransactionType.expense:
        return const NewExpenseForm();

      case TransactionType.income:
        return const NewExpenseForm();

      case TransactionType.transfer:
        return const AddNewTransformForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              titleTextStyle: theme.appBarTheme.titleTextStyle!
                  .copyWith(color: theme.colorScheme.onPrimary))),
      child: Scaffold(
        backgroundColor: _getBackgroundColor(),
        appBar: MyAppBar(title: _getPageTitle(context)),
        body: _getForm(),
      ),
    );
  }
}
