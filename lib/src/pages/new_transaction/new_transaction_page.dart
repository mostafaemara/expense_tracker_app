import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';

import 'package:expense_tracker_app/src/models/transaction_type.dart';

import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'widgets/external_transaction_form.dart';
import 'widgets/internal_transaction_form.dart';

class NewTransactionPage extends StatefulWidget {
  final TransactionType transactionType;
  const NewTransactionPage({Key? key, required this.transactionType})
      : super(key: key);

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  late NewTransactionCubit _newTransactionCubit;
  @override
  void didChangeDependencies() {
    _newTransactionCubit = NewTransactionCubit(
      transactionType: widget.transactionType,
    );
    _newTransactionCubit.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _newTransactionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              titleTextStyle: theme.appBarTheme.titleTextStyle!
                  .copyWith(color: theme.colorScheme.onPrimary))),
      child: Provider.value(
        value: widget.transactionType,
        child: Scaffold(
          backgroundColor: _getBackgroundColor(),
          appBar: MyAppBar(title: _getPageTitle(context)),
          body: BlocProvider.value(
            value: _newTransactionCubit,
            child: widget.transactionType == TransactionType.transfer
                ? const ExternalTransactionForm()
                : const InternalTransactionForm(),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (widget.transactionType) {
      case TransactionType.expense:
        return AppColors.red;
      case TransactionType.income:
        return AppColors.green;
      default:
        return AppColors.blue;
    }
  }

  String _getPageTitle(BuildContext context) {
    switch (widget.transactionType) {
      case TransactionType.expense:
        return AppLocalizations.of(context)!.expense;
      case TransactionType.income:
        return AppLocalizations.of(context)!.income;
      default:
        return AppLocalizations.of(context)!.transfer;
    }
  }
}
