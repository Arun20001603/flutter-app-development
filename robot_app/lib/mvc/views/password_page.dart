import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  final String email;

  PasswordPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Password')),
      body: Center(
        child: Text('Password Page for $email'),
      ),
    );
  }
}
