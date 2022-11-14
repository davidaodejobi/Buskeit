import 'dart:convert';

TokensModel tokensModelFromJson(String str) =>
    TokensModel.fromJson(json.decode(str));

String tokensModelToJson(TokensModel data) => json.encode(data.toJson());

class TokensModel {
  TokensModel({
    required this.access,
    required this.refresh,
  });

  final String access;
  final String refresh;

  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(
        access: json["access"],
        refresh: json["refresh"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}
