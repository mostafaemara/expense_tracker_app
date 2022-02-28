import 'dart:convert';

class SignupInput {
  final String email;
  final String password;
  final String name;

  SignupInput(
      {required this.email, required this.password, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }

  factory SignupInput.fromMap(Map<String, dynamic> map) {
    return SignupInput(
      email: map['email'],
      password: map['password'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupInput.fromJson(String source) =>
      SignupInput.fromMap(json.decode(source));
}
