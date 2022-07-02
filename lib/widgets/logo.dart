import 'package:flutter/material.dart';

enum LogoType {
  dark,
  light,
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/svg/logo/Rockola.png",
          height: 150,
        ),
        Image.asset(
          "assets/svg/logo/Letras.png",
          height: 80,
        ),
      ],
    );
  }
}
