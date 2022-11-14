import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.identifier,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.isActive,
    required this.isStaff,
    required this.isVerified,
    required this.channelAccounts,
  });

  final String identifier;
  final String email;
  final dynamic firstName;
  final dynamic lastName;
  final String image;
  final bool isActive;
  final bool isStaff;
  final bool isVerified;
  final List<dynamic> channelAccounts;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        identifier: json["identifier"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        isVerified: json["is_verified"],
        channelAccounts:
            List<dynamic>.from(json["channel_accounts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
        "is_active": isActive,
        "is_staff": isStaff,
        "is_verified": isVerified,
        "channel_accounts": List<dynamic>.from(channelAccounts.map((x) => x)),
      };
}
