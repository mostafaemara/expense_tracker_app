import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/repositories/transaction_repository.dart';
part "transactions_state.dart";

class TransactionsCubit extends Cubit<TransactionsState> {
  final AuthCubit _authCubit;
  final _transactionRepo = locator<TransactionRepository>();
  TransactionsCubit(this._authCubit) : super(TransactionsState([])) {
    _authCubit.stream.listen((state) {
      state.whenOrNull(
        authenticated: (user) => _fetchTransactions(user.uid),
      );
    });
  }

  void _fetchTransactions(String uid) async {
    try {
      final transactions = await _transactionRepo.getAllTransactions(uid);

      emit(TransactionsState(transactions));
    } catch (e) {
      emit(TransactionsState([]));
    }
  }
}
