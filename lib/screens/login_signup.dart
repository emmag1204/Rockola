import 'package:flutter/material.dart';
import 'package:rockola/widgets/lines.dart';
import 'package:rockola/widgets/logo.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Logo(),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(fontSize: 24),
              )),
          Lines(height: 5),
          TextButton(onPressed: () {}, child: Text("Sign Up")),
        ],
      ),
    );
  }
}
