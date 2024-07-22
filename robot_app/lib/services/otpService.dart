import 'dart:convert';
import 'package:robot_app/mvc/models/otp_model.dart';
import 'package:robot_app/utils/utils.dart';
import 'package:http/http.dart' as http;

class OtpService {
  Future<Map<String, dynamic>> otp(VerifyOtp otpverify) async {
    Map<String, dynamic> obj1 = {
      "email": otpverify.email,
      "otp": otpverify.otp
    };
    try {
      var response = await http.post(
        Uri.parse(RobotServiceUrl.verifyOtp),
        body: jsonEncode(obj1),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Invaild otp');
      }
    } catch (e) {
      print("Reg error $e");
      throw Exception('Otpverify: Failed to load API Data');
    }
  }
}
