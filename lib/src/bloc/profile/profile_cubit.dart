import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/models/user.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.init());

  final _userRepo = locator<UserRepository>();

  void init() async {
    final user = await _userRepo.readUser();
    emit(state.copyWith(isLoading: false, user: user));
  }
}
