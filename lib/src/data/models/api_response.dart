import 'dart:convert';

class ApiResponse {
  final Status status;
  final Map<String, dynamic> data;
  final String message;

  ApiResponse(this.status, this.data, this.message);

  Map<String, dynamic> toMap() {
    return {
      'status': status.value,
      'data': data,
      'message': message,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      Status.parse(map['status']),
      Map<String, dynamic>.from(map['data']),
      map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));
}

enum Status {
  error("error"),
  success("success");

  const Status(this.value);
  final String value;

  factory Status.parse(String value) {
    switch (value) {
      case "error":
        return Status.error;
      case "success":
        return Status.success;
      default:
        throw const FormatException("invalid status");
    }
  }
}
