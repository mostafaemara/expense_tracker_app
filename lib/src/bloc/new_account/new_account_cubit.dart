import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/repositories/accounts_repository.dart';

import '../submission_state.dart';

class NewAccountCubit extends Cubit<SubmissionState> {
  final AuthCubit _authCubit;
  final _accountsRepository = locator<AccountsRepository>();
  NewAccountCubit(this._authCubit) : super(const SubmissionState.idle());

  void addNewAccount(Account account) {
    _authCubit.state.whenOrNull(
      authenticated: (user) {
        try {
          emit(const SubmissionState.submitting());
          _accountsRepository.addAccount(account, user.uid);
          emit(const SubmissionState.success());
        } catch (e) {
          emit(const SubmissionState.failed(failure: null));
        }
      },
    );
  }
}
