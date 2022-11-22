// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_tracker_app/src/data/models/frequent_transaction.dart';

class TransactionFrequenciesState {
  const TransactionFrequenciesState(this.frequencies, this.isLoading);

  final List<TransactionFrequency> frequencies;
  final bool isLoading;

  TransactionFrequenciesState copyWith({
    List<TransactionFrequency>? frequencies,
    bool? isLoading,
  }) {
    return TransactionFrequenciesState(
      frequencies ?? this.frequencies,
      isLoading ?? this.isLoading,
    );
  }
}
