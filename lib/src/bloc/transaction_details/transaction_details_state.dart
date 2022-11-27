// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';

class TransactionDetailsState {
  final Status status;
  final Transaction? transaction;
  final String error;

  TransactionDetailsState(this.status, this.transaction, this.error);

  TransactionDetailsState copyWith({
    Status? status,
    Transaction? transaction,
    String? error,
  }) {
    return TransactionDetailsState(
      status ?? this.status,
      transaction ?? this.transaction,
      error ?? this.error,
    );
  }
}
