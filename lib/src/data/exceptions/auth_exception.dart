enum AuthError {
  emailAlreadyInUse,
  invalidEmailOrPassword,

  emailNotFound,

  invalidCode
}

class AuthException implements Exception {
  final AuthError error;

  AuthException(this.error);
}
