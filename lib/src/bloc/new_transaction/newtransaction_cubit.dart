import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/bloc/submission_state.dart';
import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';
import "../../extenstions/transaction_list_helper.dart";
import "../../extenstions/acount_list_helpers.dart";
import 'package:expense_tracker_app/src/repositories/transaction_repository.dart';

class NewTransactionCubit extends Cubit<SubmissionState<TransactionException>> {
  NewTransactionCubit(
      {required this.authCubit,
      required this.transactionsCubit,
      required this.accountsCubit})
      : super(const SubmissionState.idle());

  final AuthCubit authCubit;
  final TransactionsCubit transactionsCubit;
  final AccountsCubit accountsCubit;
  final _transactionRepository = locator<TransactionRepository>();

  void addTransaction(TransactionInput transactionInput) {
    final accountId = transactionInput.accountId;
    final amount = transactionInput.amount;

    authCubit.state.whenOrNull(
      authenticated: (user) async {
        try {
          emit(const SubmissionState.submitting());
          transactionInput.type.whenOrNull(
            expense: () => _checkIfAccountBalanceIsEnough(accountId, amount),
            sentTransfer: () =>
                _checkIfAccountBalanceIsEnough(accountId, amount),
          );

          final transaction = await _transactionRepository.addTransaction(
              transactionInput, user.uid);
          transactionsCubit.addTransaction(transaction);
          emit(const SubmissionState.success());
        } on TransactionException catch (e) {
          emit(SubmissionState.failed(failure: e));
        }
      },
    );
  }

  void _checkIfAccountBalanceIsEnough(String accountId, double amount) {
    final accountBalance = _accountBalance(accountId);
    if (amount > accountBalance) {
      throw TransactionException.notEnoughBalance(
          availbleBalance: accountBalance);
    }
  }

  double _accountBalance(String id) {
    final transactions = transactionsCubit.state.transactions;
    final selectedAccount = accountsCubit.state.accounts.findById(id);
    final accountBalance = selectedAccount.balance;
    final accountTransactions = transactions.filterByAccountId(id);
    final totalAmount = accountTransactions.totalAmount();
    return accountBalance + totalAmount;
  }
}
