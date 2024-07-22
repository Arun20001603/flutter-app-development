class RobotServiceUrl {
  static const String baseUrl = "https://securelogin-otp-nodejs.onrender.com";

  static const String registerUser = baseUrl + "/validate-user";
  static const String verifyOtp = baseUrl + "/verify-otp";
  static const String resetPassword = baseUrl + "/create-password";
  static const String loginUser = baseUrl + "/login";
  static const String forgotPasswordOtp = baseUrl + "/forgotpassword";
  static const String forgotPasswordOtpVerify =
      baseUrl + "/password-otp-verify";
  static const String forgotPasswordReset = baseUrl + "/forget-reset-password";
}
