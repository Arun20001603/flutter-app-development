import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:robot_app/mvc/views/login_page.dart';
import 'package:robot_app/mvc/views/otp_page.dart';
import 'package:robot_app/mvc/views/password_page.dart';
import 'package:robot_app/services/registerService.dart';
import 'package:robot_app/mvc/models/registerUser_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_page_test.mocks.dart';

@GenerateMocks([RegisterService])
void main() {
  late MockRegisterService mockRegisterService;

  setUp(() {
    mockRegisterService = MockRegisterService();
  });

  Future<void> pumpLoginPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(),
      ),
    );
  }

  testWidgets('Login button is disabled when email is invalid',
      (WidgetTester tester) async {
    await pumpLoginPage(tester);

    await tester.enterText(find.byType(TextFormField), 'invalidemail');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Please enter a valid email address '), findsOneWidget);
  });

  testWidgets('Login button shows CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    await pumpLoginPage(tester);

    await tester.enterText(find.byType(TextFormField), 'arun9080950@gmail.com');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Navigates to OTPPage when isFirstTime is true',
      (WidgetTester tester) async {
    when(mockRegisterService.register(any))
        .thenAnswer((_) async => {'isFirstTime': true});

    await pumpLoginPage(tester);

    await tester.enterText(
        find.byType(TextFormField), 'arun908095097@gmail.com');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(mockRegisterService.register(any)).called(1);
    await tester.pumpAndSettle();

    expect(find.byType(OTPPage), findsOneWidget);
  });

  testWidgets('Navigates to PasswordPage when isFirstTime is false',
      (WidgetTester tester) async {
    when(mockRegisterService.register(any))
        .thenAnswer((_) async => {'isFirstTime': false});

    await pumpLoginPage(tester);

    await tester.enterText(find.byType(TextFormField), 'arun9080950@gmail.com');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(mockRegisterService.register(any)).called(1);
    await tester.pumpAndSettle();

    expect(find.byType(PasswordPage), findsOneWidget);
  });

  testWidgets('Shows SnackBar when email is invalid',
      (WidgetTester tester) async {
    when(mockRegisterService.register(any))
        .thenAnswer((_) async => {'isFirstTime': null});

    await pumpLoginPage(tester);

    await tester.enterText(find.byType(TextFormField), 'arun90809@example.com');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(mockRegisterService.register(any)).called(1);
    await tester.pump(); // To show SnackBar

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Invalid emailId'), findsOneWidget);
  });
}
