enum AuthError {
  emailAlreadyInUse,
  invalidEmailOrPassword,
  serverError,
  emailNotFound,

  invalidCode
}

class AuthException implements Exception {
  final AuthError error;

  AuthException(this.error);
}
