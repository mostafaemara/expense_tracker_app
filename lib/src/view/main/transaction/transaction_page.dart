import 'package:flutter/material.dart';

import 'widgets/filter_button.dart';
import 'widgets/financial_report_button.dart';
import 'widgets/section_title.dart';
import 'widgets/transactions_list_view.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            const SectionTitle(
              title: "Today",
            ),
            const TransactionListView(
              transactions: [],
            ),
            const SectionTitle(
              title: "Yesterday",
            ),
            const TransactionListView(
              transactions: [],
            )
          ],
        ),
      ),
    );
  }
}
