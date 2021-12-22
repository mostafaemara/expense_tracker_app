abstract class UserRepository {
  Future<void> setUserName(String uid, String username);

  Future<bool> getIsUserSetup(String uid);
  Future<void> setUserIsSetup(String uid);
}
