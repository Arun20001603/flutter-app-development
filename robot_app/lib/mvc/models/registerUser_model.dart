// To parse this JSON data, do
//
//     final registerUser = registerUserFromJson(jsonString);

import 'dart:convert';

RegisterUser registerUserFromJson(String str) =>
    RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  String email;

  RegisterUser({
    required this.email,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
