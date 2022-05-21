import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/submission_state.dart';

import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:expense_tracker_app/src/helpers/acount_list_helpers.dart';
import 'package:expense_tracker_app/src/helpers/categories_helper.dart';
import 'package:expense_tracker_app/src/helpers/image_helper.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';
import 'package:expense_tracker_app/src/data/models/transaction_type.dart';
import 'package:expense_tracker_app/src/helpers/transaction_list_helper.dart';

import 'package:image_picker/image_picker.dart';

import 'newtransaction_state.dart';

class NewTransactionCubit extends Cubit<NewTransactionState> {
  NewTransactionCubit({
    required this.transactionType,
  }) : super(const NewTransactionState.init());

  final _transactionRepository = locator<TransactionRepositoryImpl>();

  final TransactionType transactionType;

  void init() async {
    try {
      final accounts = await _transactionRepository.getAccounts();

      final categories = await _transactionRepository.getAllCategories();

      final categoriesOfSelectedType =
          categories.filterByTransactionType(transactionType);

      emit(state.copyWith(
          categories: categoriesOfSelectedType,
          isInit: true,
          targetAccounts: accounts,
          accounts: accounts));
    } catch (e) {
      log(e.toString());
    }
  }

  void addTransaction(String balance, String description, String title) async {
    try {
      if (state.selectedCategory == null || state.selectedAccount == null) {
        emit(state.copyWith(
            submissionState: const SubmissionState.failed(
                failure: TransactionException.serverError())));
        return;
      }
      final String accountId = state.selectedAccount!;
      final double amount = double.tryParse(balance)!;
      emit(state.copyWith(submissionState: const SubmissionState.submitting()));

      if (transactionType == TransactionType.expense ||
          transactionType == TransactionType.sent) {
        await _checkIfAccountBalanceIsEnough(accountId, amount);
      }

      await _transactionRepository.addTransaction(TransactionInput(
          title: title,
          accountId: accountId,
          amount: amount,
          category: state.selectedCategory!,
          description: description,
          type: transactionType,
          attachment: state.selectedAttachment ?? ""));

      emit(state.copyWith(submissionState: const SubmissionState.success()));
    } on TransactionException catch (e) {
      emit(state.copyWith(submissionState: SubmissionState.failed(failure: e)));
    }
  }

  Future _checkIfAccountBalanceIsEnough(String accountId, double amount) async {
    final accountBalance = await _accountBalance(accountId);
    if (amount > accountBalance) {
      throw TransactionException.notEnoughBalance(
          availbleBalance: accountBalance);
    }
  }

  Future<double> _accountBalance(String id) async {
    final transactions = await _transactionRepository.getAllTransactions();
    final selectedAccount = state.accounts.findById(id);
    final accountBalance = selectedAccount.balance;
    final accountTransactions = transactions.filterByAccountId(id);
    final totalAmount = accountTransactions.totalAmount();
    return accountBalance + totalAmount;
  }

  void selectAttachment(ImageSource imageSource) async {
    final file = await ImagePicker()
        .pickImage(source: imageSource, maxHeight: 800, maxWidth: 600);
    if (file != null) {
      final selectedAttachment = await file.convertToBase64Image();
      emit(state.copyWith(selectedAttachment: selectedAttachment));
    }
  }

  void selectCategory(Category? category) {
    if (category == null) {
      return;
    }
    log("categ changed");
    emit(state.copyWith(selectedCategory: category));
  }

  void selectAccount(String? accountId) {
    if (accountId == null) {
      return;
    }

    final targetAccounts = [...state.accounts];

    targetAccounts.removeWhere(
      (element) => element.id == accountId,
    );
    log("account changed");
    emit(state.copyWith(
        selectedAccount: accountId, targetAccounts: targetAccounts));
  }

  void selectTargetAccount(String? accountId) {
    if (accountId == null) {
      return;
    }

    emit(state.copyWith(selectedTargetAccount: accountId));
  }

  void cancelAttachment() {
    emit(state.copyWith(selectedAttachment: null));
  }
}
