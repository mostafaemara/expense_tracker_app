import 'dart:convert';

class User {
  final String id;
  final String email;
  final String image;
  final String token;

  User(
      {required this.id,
      required this.email,
      required this.image,
      required this.token});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["id"],
        email: map["email"],
        image: map["image"],
        token: map["token"]);
  }

  factory User.fromJson(String jsonString) {
    final map = json.decode(jsonString);
    return User.fromMap(map);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "email": email, "image": image, "token": token};
  }

  String toJson() {
    return json.encode(toMap());
  }
}
