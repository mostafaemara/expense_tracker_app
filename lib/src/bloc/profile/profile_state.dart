part of 'profile_cubit.dart';

class ProfileState {
  final bool isLoading;
  late final User user;

  ProfileState(this.isLoading, this.user);

  ProfileState.init() : isLoading = true;

  ProfileState copyWith({
    bool? isLoading,
    User? user,
  }) {
    return ProfileState(
      isLoading ?? this.isLoading,
      user ?? this.user,
    );
  }
}
