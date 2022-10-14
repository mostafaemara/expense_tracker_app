import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import "package:expense_tracker_app/src/helpers/exception_helper.dart";
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/data/repositories/account_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/transaction_repository.dart';
import 'package:expense_tracker_app/src/helpers/categories_helper.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';
import 'package:flutter/rendering.dart';

import '../../data/repositories/user_repository.dart';
import 'newtransaction_state.dart';

class NewTransactionCubit extends Cubit<NewTransactionState> {
  NewTransactionCubit({
    required this.transactionType,
  }) : super(const NewTransactionState.init());

  final _transactionRepository = locator<TransactionRepository>();
  final _accountRepo = locator<AccountRepository>();
  final _userRepo = locator<UserRepository>();
  final TransactionType transactionType;

  void init() async {
    try {
      final _user = await _userRepo.readUser();
      final accounts = await _accountRepo.getAccounts(_user!.id);

      final categories = await _transactionRepository.getAllCategories();

      final categoriesOfSelectedType =
          categories.filterByTransactionType(transactionType);

      emit(state.copyWith(
          status: Status.idle,
          categories: categoriesOfSelectedType,
          accounts: accounts));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(error: error));
    }
  }

  void addTransaction(TransactionInput input) async {
    try {
      emit(state.copyWith(
        status: Status.loading,
      ));

      await _transactionRepository.addTransaction(input);

      emit(state.copyWith(status: Status.success));
    } on Exception catch (e) {
      final error = await e.parse(const Locale("en"));
      emit(state.copyWith(status: Status.error, error: error));
    }
  }

  // void selectAttachment(ImageSource imageSource) async {
  //   final file = await ImagePicker()
  //       .pickImage(source: imageSource, maxHeight: 800, maxWidth: 600);
  //   if (file != null) {
  //     final selectedAttachment = await file.convertToBase64Image();
  //     emit(state.copyWith(selectedAttachment: selectedAttachment));
  //   }
  // }

}
