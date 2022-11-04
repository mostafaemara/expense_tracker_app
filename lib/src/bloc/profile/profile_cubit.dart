import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/user.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';

import '../../data/repositories/auth_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.init());
  final _authRepo = locator<AuthRepository>();
  final _userRepo = locator<UserRepository>();

  Future<void> init() async {
    final user = await _userRepo.readUser();
    emit(state.copyWith(isLoading: false, user: user));
  }

  Future<void> logout() async {
    await _authRepo.logout();
    await _userRepo.deleteUser();
  }

  Future<void> updateProfile({String? userName, File? image}) async {
    emit(state.copyWith(isLoading: true));
    if (userName != null) {
      final user = await _authRepo.updateUserName(userName);
      await _userRepo.writeUser(user);
      emit(state.copyWith(user: user));
    }

    if (image != null) {
      final user = await _authRepo.updateUserProfile(image);
      await _userRepo.writeUser(user);
      emit(state.copyWith(user: user));
    }
    emit(state.copyWith(isLoading: false));
  }
}
