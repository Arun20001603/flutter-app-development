import 'dart:convert';

Resetpassword resetpasswordFromJson(String str) =>
    Resetpassword.fromJson(json.decode(str));

String resetpasswordToJson(Resetpassword data) => json.encode(data.toJson());

class Resetpassword {
  String email;
  String password;

  Resetpassword({
    required this.email,
    required this.password,
  });

  factory Resetpassword.fromJson(Map<String, dynamic> json) => Resetpassword(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
