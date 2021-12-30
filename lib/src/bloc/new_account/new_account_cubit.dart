import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/repositories/accounts_repository.dart';

import '../submission_state.dart';

class NewAccountCubit extends Cubit<SubmissionState> {
  final AuthCubit authCubit;
  final AccountsCubit accountsCubit;

  final _accountsRepository = locator<AccountsRepository>();

  NewAccountCubit({
    required this.authCubit,
    required this.accountsCubit,
  }) : super(const SubmissionState.idle());

  void addNewAccount(
    AccountInput accountInput,
  ) {
    authCubit.state.whenOrNull(
      authenticated: (user) async {
        try {
          emit(const SubmissionState.submitting());
          final account =
              await _accountsRepository.addAccount(accountInput, user.uid);
          accountsCubit.addAccount(account);

          emit(const SubmissionState.success());
        } catch (e) {
          emit(const SubmissionState.failed(failure: null));
        }
      },
    );
  }
}
