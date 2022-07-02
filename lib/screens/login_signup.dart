import 'package:flutter/material.dart';
import 'package:rockola/constants/colors.dart';
import 'package:rockola/widgets/lines.dart';
import 'package:rockola/widgets/logo.dart';
import 'package:google_fonts/google_fonts.dart';

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
          const SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "LOG IN",
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: RockolaColors.almostWhite,
                ),
              )),
          const Lines(height: 5),
          TextButton(
              onPressed: () {},
              child: Text("SIGN UP",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: RockolaColors.almostWhite,
                  ))),
        ],
      ),
    );
  }
}
