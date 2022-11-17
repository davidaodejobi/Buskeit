// import 'dart:convert';

// import 'package:buskeit/core/core.dart';

// ResModel resModelFromJson(String str) => ResModel.fromJson(json.decode(str));

// String resModelToJson(ResModel data) => json.encode(data.toJson());

// class ResModel {
//   ResModel({
//     this.success = false,
//     this.detail = '',
//     this.tokens,
//     this.user,
//   });

//   final bool success;
//   final String detail;
//   final TokensModel? tokens;
//   final dynamic user;

//   factory ResModel.fromJson(Map<String, dynamic> json) => ResModel(
//         success: json["success"] == null ? null : json['success'],
//         detail: json["detail"] == null ? null : json['detail'],
//         tokens: json["tokens"] == null
//             ? null
//             : TokensModel.fromJson(json["tokens"]),
//         user: json["user"] == null ? null : json['user'],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "detail": detail,
//         "tokens": tokens!.toJson(),
//         "user": user.toJson(),
//       };
// }
