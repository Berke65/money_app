import 'package:flutter/material.dart';
import 'package:money_app/LoginPage.dart';
import 'package:money_app/HomePage.dart';

void main() {
  runApp(const moneyApp());
}

class moneyApp extends StatefulWidget {
  const moneyApp({super.key});

  @override
  State<moneyApp> createState() => _moneyAppState();
}

class _moneyAppState extends State<moneyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
