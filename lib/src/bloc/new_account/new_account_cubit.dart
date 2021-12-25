import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/repositories/accounts_repository.dart';
import 'package:expense_tracker_app/src/repositories/user_repository.dart';

import '../submission_state.dart';

class NewAccountCubit extends Cubit<SubmissionState> {
  final AuthCubit _authCubit;
  final bool isSettingUpAccount;
  final _accountsRepository = locator<AccountsRepository>();
  final _userRepository = locator<UserRepository>();
  NewAccountCubit(this._authCubit, {this.isSettingUpAccount = false})
      : super(const SubmissionState.idle());

  void addNewAccount(
    Account account,
  ) {
    _authCubit.state.whenOrNull(
      authenticated: (user) async {
        try {
          emit(const SubmissionState.submitting());
          await _accountsRepository.addAccount(account, user.uid);
          if (isSettingUpAccount) {
            await _userRepository.setUserIsSetup(user.uid);
          }
          emit(const SubmissionState.success());
        } catch (e) {
          emit(const SubmissionState.failed(failure: null));
        }
      },
    );
  }
}
