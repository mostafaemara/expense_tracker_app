import 'package:expense_tracker_app/src/bloc/transaction_frequencies/transaction_frequencies_state.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';

class TransactionFrequenciesCubit extends Cubit<TransactionFrequenciesState> {
  TransactionFrequenciesCubit()
      : super(const TransactionFrequenciesState([], true));
  final transactionRepo = locator<TransactionRepository>();
  void init() async {
    try {
      final frequencies = await transactionRepo.readTransactionsFrequencies();
      emit(state.copyWith(frequencies: frequencies, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
