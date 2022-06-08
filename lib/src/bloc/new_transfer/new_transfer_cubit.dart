import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transfer_input.dart';
import 'package:expense_tracker_app/src/data/repositories/account_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:expense_tracker_app/src/helpers/exception_helper.dart';

import '../submission_status.dart';
import 'new_tranfer_state.dart';

class NewTransferCubit extends Cubit<NewTransferState> {
  NewTransferCubit() : super(const NewTransferState.init());

  final _transactionRepository = locator<TransactionRepository>();
  final _accountRepo = locator<AccountRepository>();
  void init() async {
    try {
      final accounts = await _accountRepo.getAccounts();

      emit(state.copyWith(accounts: accounts));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error, status: Status.error));
    }
  }

  void addTransfer(TransferInput input) async {
    try {
      emit(state.copyWith(status: Status.loading));

      await _transactionRepository.addTransfer(input);

      emit(state.copyWith());
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(
        state.copyWith(error: error, status: Status.error),
      );
    }
  }
}
