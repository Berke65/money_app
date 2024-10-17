import 'package:flutter/material.dart';
import 'package:money_app/LoginPage.dart';
import 'package:money_app/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
