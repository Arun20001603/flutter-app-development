import 'dart:convert';
import 'package:robot_app/mvc/models/registerUser_model.dart';
import 'package:robot_app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  Future<Map<String, dynamic>> register(RegisterUser registerUser) async {
    Map<String, dynamic> obj1 = {"email": registerUser.email};
    try {
      var response = await http.post(
        Uri.parse(RobotServiceUrl.registerUser),
        body: jsonEncode(obj1),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      print("Reg error $e");
      throw Exception('Register: Failed to load API Data');
    }
  }
}
