import 'dart:convert';

TokensModel tokensModelFromJson(String str) =>
    TokensModel.fromJson(json.decode(str));

String tokensModelToJson(TokensModel data) => json.encode(data.toJson());

class TokensModel {
  TokensModel({
    this.access,
    this.refresh,
  });

  final String? access;
  final String? refresh;

  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(
        access: json["access"] as String? ?? '',
        refresh: json["refresh"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}
