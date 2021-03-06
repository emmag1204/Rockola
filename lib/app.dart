import 'package:flutter/material.dart';
import 'package:rockola/screens/login_signup.dart';
import 'package:rockola/constants/theme.dart';

class RockolaApp extends StatefulWidget {
  const RockolaApp({Key? key}) : super(key: key);

  @override
  State<RockolaApp> createState() => _RockolaAppState();
}

class _RockolaAppState extends State<RockolaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rockola",
      theme: RockolaThemes.getTheme(context),
      home: const LoginSignUpScreen(),
    );
  }
}
