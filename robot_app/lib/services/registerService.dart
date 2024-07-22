import 'dart:convert';
import 'package:robot_app/mvc/models/registerUser_model.dart';
import 'package:robot_app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  Future<dynamic> register(RegisterUser registerUser) async {
    Map<String, dynamic> obj1 = {"email": registerUser.email};
    try {
      var response = await http.post(
        Uri.parse(RobotServiceUrl.registerUser),
        body: jsonEncode(obj1),
        headers: {"Content-Type": "application/json ; charset=UTF-8"},
      );
      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final email = responseData['email'];

        await saveResponseToStorage(email);
        print("response data :${responseData}");
      }

      return response.body;
    } catch (e) {
      print("Reg error ${e}");
      throw Exception(' Register : Failed to load API Data');
    }
  }

  Future<void> saveResponseToStorage(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }
}
