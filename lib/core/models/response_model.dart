import 'dart:convert';

import 'package:buskeit/core/models/models.dart';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.success,
    this.message,
    this.tokens,
    this.user,
  });

  final bool? success;
  final String? message;
  final TokensModel? tokens;
  final dynamic user;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        success: json["success"] == null ? null : json['success'],
        message: json["message"] == null ? null : json['message'],
        tokens: json["tokens"] == null
            ? null
            : TokensModel.fromJson(json["tokens"]),
        user: json["user"] == null ? null : json['user'],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "tokens": tokens!.toJson(),
        "user": user.toJson(),
      };
}
