import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_state.dart';

import 'package:expense_tracker_app/src/bloc/submission_state.dart';

import 'package:expense_tracker_app/src/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/extenstions/transaction_list_helper.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';
import 'package:expense_tracker_app/src/models/transaction_type.dart';
import 'package:expense_tracker_app/src/repositories/categories/categories_repository.dart';
import 'package:expense_tracker_app/src/repositories/transactions/transaction_repository.dart';
import "../../extenstions/categories_helper.dart";
import "../../extenstions/acount_list_helpers.dart";

class NewTransactionCubit extends Cubit<NewTransactionState> {
  NewTransactionCubit({
    required this.accountsCubit,
    required this.transactionType,
  }) : super(const NewTransactionState.init());

  final AccountsCubit accountsCubit;
  final _transactionRepository = locator<TransactionRepository>();
  final _categoriesRepository = locator<CategoriesRepository>();
  final TransactionType transactionType;
  void init() async {
    final categories = await _categoriesRepository.getAllCategories();
    log("hello");
    final categoriesOfSelectedType =
        categories.filterByTransactionType(transactionType);
    log(categoriesOfSelectedType.length.toString());
    log(categories.length.toString());
    emit(state.copyWith(categories: categoriesOfSelectedType, isInit: true));
  }

  void addTransaction(TransactionInput transactionInput) async {
    final accountId = transactionInput.accountId;
    final amount = transactionInput.amount;

    try {
      emit(state.copyWith(submissionState: const SubmissionState.submitting()));

      if (transactionInput.type == TransactionType.expense ||
          transactionInput.type == TransactionType.sent) {
        _checkIfAccountBalanceIsEnough(accountId, amount);
      }

      await _transactionRepository.addTransaction(transactionInput);

      emit(state.copyWith(submissionState: const SubmissionState.success()));
    } on TransactionException catch (e) {
      emit(state.copyWith(submissionState: SubmissionState.failed(failure: e)));
    }
  }

  void _checkIfAccountBalanceIsEnough(String accountId, double amount) async {
    final accountBalance = await _accountBalance(accountId);
    if (amount > accountBalance) {
      throw TransactionException.notEnoughBalance(
          availbleBalance: accountBalance);
    }
  }

  Future<double> _accountBalance(String id) async {
    final transactions = await _transactionRepository.getAllTransactions();
    final selectedAccount = accountsCubit.state.accounts.findById(id);
    final accountBalance = selectedAccount.balance;
    final accountTransactions = transactions.filterByAccountId(id);
    final totalAmount = accountTransactions.totalAmount();
    return accountBalance + totalAmount;
  }
}
