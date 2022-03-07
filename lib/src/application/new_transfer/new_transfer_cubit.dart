import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/application/new_transfer/new_tranfer_state.dart';
import 'package:expense_tracker_app/src/application/submission_state.dart';

import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/data/models/inputs/transfer_input.dart';

import 'package:expense_tracker_app/src/helpers/image_helper.dart';

import 'package:expense_tracker_app/src/data/repositories/interfaces/accounts_repository.dart';

import 'package:expense_tracker_app/src/data/repositories/interfaces/transaction_repository.dart';
import 'package:image_picker/image_picker.dart';

class NewTransferCubit extends Cubit<NewTransferState> {
  NewTransferCubit() : super(const NewTransferState.init());

  final _transactionRepository = locator<TransactionRepository>();

  final _accountsRepository = locator<AccountsRepository>();

  void init() async {
    try {
      final accounts = await _accountsRepository.getAccounts();

      emit(state.copyWith(
          isInit: true, targetAccounts: accounts, accounts: accounts));
    } catch (e) {
      log(e.toString());
    }
  }

  void addTransaction(
    String balance,
    String description,
  ) async {
    try {
      if (state.selectedAccount == null ||
          state.selectedTargetAccount == null) {
        emit(state.copyWith(
            submissionState: const SubmissionState.failed(
                failure: TransactionException.serverError())));
        return;
      }
      final String account = state.selectedAccount!;
      final String targetAccount = state.selectedTargetAccount!;
      final double amount = double.tryParse(balance)!;
      emit(state.copyWith(submissionState: const SubmissionState.submitting()));

      await _transactionRepository.addTransfer(TransferInput(
          title: "Transfer",
          account: account,
          amount: amount,
          targetAccount: targetAccount,
          description: description,
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
