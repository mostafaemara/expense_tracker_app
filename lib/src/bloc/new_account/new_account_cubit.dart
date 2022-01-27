import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/helpers/image_helper.dart';

import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/repositories/accounts/accounts_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../submission_state.dart';

class NewAccountCubit extends Cubit<SubmissionState> {
  final _accountsRepository = locator<AccountsRepository>();

  NewAccountCubit() : super(const SubmissionState.idle());

  void addNewAccount(
    AccountInput accountInput,
  ) async {
    try {
      emit(const SubmissionState.submitting());
      await _accountsRepository.addAccount(
        accountInput,
      );

      emit(const SubmissionState.success());
    } catch (e) {
      emit(const SubmissionState.failed(failure: null));
    }
  }
}
