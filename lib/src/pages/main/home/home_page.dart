import 'package:expense_tracker_app/src/bloc/Home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/head.dart';
import 'widgets/recent_transaction.dart';
import 'widgets/spend_frequency_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Head(),
              SpendFrequencyChart(),
              RecentTransaction()
            ],
          ),
        );
      },
    );
  }
}
