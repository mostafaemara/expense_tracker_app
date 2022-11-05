import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/bloc/transactions/transactions_state.dart';
import 'package:expense_tracker_app/src/view/common/transaction_list_item.dart';
import 'package:expense_tracker_app/src/view/common/transactions_of_date_list_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/app_router.dart';
import '../common/empty_transactions.dart';
import 'widgets/filter_button.dart';
import 'widgets/financial_report_button.dart';
import '../common/month_drop_down_button.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void didChangeDependencies() {
    context.read<TransactionCubit>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionsState>(
      builder: (context, state) => SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthDropDownButton(
                            value: state.selectedMonth,
                            onChanged: (date) {
                              if (date != null) {
                                context
                                    .read<TransactionCubit>()
                                    .selectMonth(date);
                              }
                            }),
                        FilterButton(isFilterActive: state.isFilterActive())
                      ],
                    )),
                const FinancialReportButton(),
                state.transactionsOfDates.isEmpty
                    ? const EmptyTransactions()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        child: Column(
                            children: state.transactionsOfDates
                                .map((e) => TransactionsOfDateListItem(
                                      date: e.date,
                                      transactions: e.transactions
                                          .map((t) => TransactionListItem(
                                                onPressed: () async {
                                                  final result = await AutoRouter
                                                          .of(context)
                                                      .push(
                                                          TransactionDetailsRoute(
                                                              transaction: t));

                                                  if (result != null) {
                                                    context
                                                        .read<
                                                            TransactionCubit>()
                                                        .init();
                                                  }
                                                },
                                                transaction: t,
                                              ))
                                          .toList(),
                                    ))
                                .toList()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
