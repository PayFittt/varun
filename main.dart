import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(PayFitApp());
}

class PayFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
    );
  }
}

