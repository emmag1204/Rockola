import 'package:flutter/material.dart';
import 'package:rockola/constants/colors.dart';

class Lines extends StatelessWidget {
  final double height;
  const Lines({Key? key, this.height = 10.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: height,
        color: RockolaColors.primaryPurple,
      ),
      Container(
        height: height,
        color: RockolaColors.almostRed,
      ),
      Container(
        height: height,
        color: RockolaColors.red,
      ),
      Container(
        height: height,
        color: RockolaColors.primaryOrange,
      ),
    ]);
  }
}
