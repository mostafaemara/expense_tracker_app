import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:expense_tracker_app/src/data/repositories/auth_repository.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';

import '../../../../injection.dart';
import '../../data/repositories/config_repository.dart';
import '../submission_status.dart';

class UpdateProfileCubit extends Cubit<SubmissionState> {
  UpdateProfileCubit() : super(const SubmissionState.init());

  final _authRepo = locator<AuthRepository>();
  final _userRepo = locator<UserRepository>();

  Future<void> updateProfile({String? userName, File? image}) async {
    try {
      emit(state.copyWith(submissionStatus: Status.loading));
      if (userName != null) {
        final user = await _authRepo.updateUserName(userName);
        await _userRepo.writeUser(user);
      }

      if (image != null) {
        final user = await _authRepo.updateUserProfile(image);
        await _userRepo.writeUser(user);
      }
      emit(state.copyWith(submissionStatus: Status.success));
    } catch (e) {
      final appLocalization =
          await locator<ConfigRepository>().loadAppLocalizations();
      emit(state.copyWith(
          error: appLocalization.unownError, submissionStatus: Status.error));
    }
  }
}
