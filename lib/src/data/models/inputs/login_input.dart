import 'dart:convert';

class LoginInput {
  final String email;
  final String password;

  LoginInput({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginInput.fromMap(Map<String, dynamic> map) {
    return LoginInput(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginInput.fromJson(String source) =>
      LoginInput.fromMap(json.decode(source));
}
