import 'dart:convert';

ErrorModelLogin errorModelFromJson(String str) =>
    ErrorModelLogin.fromJson(json.decode(str));

String countriesModelToJson(ErrorModelLogin data) => json.encode(data.toJson());

class ErrorModelLogin {
  ErrorModelLogin({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ErrorModelLogin.fromJson(Map<String, dynamic> json) =>
      ErrorModelLogin(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
