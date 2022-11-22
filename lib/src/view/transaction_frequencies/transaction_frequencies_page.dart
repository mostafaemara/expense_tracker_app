import 'package:expense_tracker_app/src/bloc/transaction_frequencies/transaction_frequencies_cubit.dart';
import 'package:expense_tracker_app/src/bloc/transaction_frequencies/transaction_frequencies_state.dart';
import 'package:expense_tracker_app/src/view/common/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionFrequenciesPage extends StatefulWidget {
  const TransactionFrequenciesPage({super.key});

  @override
  State<TransactionFrequenciesPage> createState() =>
      _TransactionFrequenciesPageState();
}

class _TransactionFrequenciesPageState
    extends State<TransactionFrequenciesPage> {
  @override
  void didChangeDependencies() {
    context.read<TransactionFrequenciesCubit>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: "Transactions Frequencies"),
        body: BlocBuilder<TransactionFrequenciesCubit,
                TransactionFrequenciesState>(
            builder: (context, state) => state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    child: const Text("TEst"),
                  )));
  }
}
