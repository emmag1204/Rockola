import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/svg/logo/Rockola.svg",
          height: 100,
        ),
        SvgPicture.asset(
          "assets/svg/logo/Letras.svg",
          height: 100,
        ),
      ],
    );
  }
}
