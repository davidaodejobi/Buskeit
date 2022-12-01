import 'dart:convert';

import 'package:buskeit/core/models/models.dart';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  bool? success;
  String? detail;
  TokensModel? tokens;
  UserModel? user;

  ResponseModel({this.success, this.detail, this.tokens, this.user});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    detail = json['detail'];
    tokens =
        json['tokens'] != null ? TokensModel.fromJson(json['tokens']) : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['detail'] = detail;
    if (tokens != null) {
      data['tokens'] = tokens!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
