import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/bloc/transactions/transactions_state.dart';
import 'package:expense_tracker_app/src/view/main/transaction/widgets/transactions_of_date_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/filter_button.dart';
import 'widgets/financial_report_button.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionsState>(
      builder: (context, state) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: AppBar(
                  actions: [FilterButton()],
                ),
              ),
              const FinancialReportButton(),
              TransactionsOfDateListView(
                transactionsOfDates: state.transactionsOfDates,
              )
            ],
          ),
        ),
      ),
    );
  }
}
