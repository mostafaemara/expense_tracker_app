import 'package:flutter/material.dart';

import 'widgets/head.dart';
import 'widgets/recent_transaction.dart';
import 'widgets/spend_frequency_chart.dart';

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
