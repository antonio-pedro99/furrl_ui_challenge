import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/constants.dart';

class Ballon extends StatelessWidget {
  const Ballon({Key? key, this.radius = 200}) : super(key: key);

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: blue30,
      ),
    );
  }
}
