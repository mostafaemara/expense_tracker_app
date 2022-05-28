import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/old_sub_state/submission_state.dart';

import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:expense_tracker_app/src/helpers/categories_helper.dart';
import 'package:expense_tracker_app/src/helpers/image_helper.dart';
import 'package:expense_tracker_app/src/data/models/category.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';

import 'package:image_picker/image_picker.dart';

import 'newtransaction_state.dart';

class NewTransactionCubit extends Cubit<NewTransactionState> {
  NewTransactionCubit({
    required this.transactionType,
  }) : super(const NewTransactionState.init());

  final _transactionRepository = locator<TransactionRepository>();

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
