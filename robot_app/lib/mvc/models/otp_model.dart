import 'dart:convert';

VerifyOtp verifyOtpFromJson(String str) => VerifyOtp.fromJson(json.decode(str));

String verifyOtpToJson(VerifyOtp data) => json.encode(data.toJson());

class VerifyOtp {
  String email;
  String otp;

  VerifyOtp({
    required this.email,
    required this.otp,
  });

  factory VerifyOtp.fromJson(Map<String, dynamic> json) => VerifyOtp(
        email: json["email"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
      };
}
