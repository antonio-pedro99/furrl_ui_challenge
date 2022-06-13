import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/widgets/circle.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Transform.rotate(angle: pi, child: const CirC(d: 170)),
          Transform.rotate(angle: pi / 2, child: const CirC(d: 170))
        ],
      ),
    );
  }
}

