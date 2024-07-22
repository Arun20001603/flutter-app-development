import 'package:flutter/material.dart';

class OTPPage extends StatelessWidget {
  final String email;

  OTPPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter OTP')),
      body: Center(
        child: Text('OTP Page for $email'),
      ),
    );
  }
}
