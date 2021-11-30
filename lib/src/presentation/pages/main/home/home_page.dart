import 'package:expense_tracker_app/src/presentation/pages/main/home/widgets/recent_transaction.dart';
import 'package:expense_tracker_app/src/presentation/pages/main/home/widgets/spend_frequency_chart.dart';
import 'package:flutter/material.dart';

import 'widgets/head.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [Head(), SpendFrequencyChart(), RecentTransaction()],
      ),
    );
  }
}
