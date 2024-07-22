import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:robot_app/mvc/models/registerUser_model.dart';
import 'package:robot_app/services/registerService.dart';
import 'package:robot_app/utils/utils.dart';

import 'register_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late RegisterService registerService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    registerService = RegisterService();
  });

  group('RegisterService', () {
    test('returns data if the http call completes successfully', () async {
      final user = RegisterUser(email: 'test@example.com');
      final jsonResponse = jsonEncode({'isFirstTime': true});

      when(mockClient.post(
        Uri.parse(RobotServiceUrl.registerUser),
        body: jsonEncode({'email': user.email}),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      )).thenAnswer((_) async => http.Response(jsonResponse, 200));

      final result = await registerService.register(user);

      expect(result, {'isFirstTime': true});
    });

    test('throws an exception if the http call completes with an error',
        () async {
      final user = RegisterUser(email: 'test@example.com');

      when(mockClient.post(
        Uri.parse(RobotServiceUrl.registerUser),
        body: jsonEncode({'email': user.email}),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      )).thenAnswer((_) async => http.Response('Error', 500));

      expect(() => registerService.register(user), throwsException);
    });

    test('throws an exception if the http call fails', () async {
      final user = RegisterUser(email: 'test@example.com');

      when(mockClient.post(
        Uri.parse(RobotServiceUrl.registerUser),
        body: jsonEncode({'email': user.email}),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      )).thenThrow(Exception('Failed to connect'));

      expect(() => registerService.register(user), throwsException);
    });
  });
}
