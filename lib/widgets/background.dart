import 'dart:math';

import 'package:flutter/material.dart';

import 'package:pacientes/widgets/widgets.dart';

class Background extends StatelessWidget {
  final Color = Colores();

  // final boxDecoration = const BoxDecoration(
  //     color: Color.threC
  // );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple Gradinet
        Container(color: Color.threC, ),

        // green box
        Positioned(
          top: -100,
          left: -30,
          child: _GreenBox()
        ),
      ],
    );
  }
}


class _GreenBox extends StatelessWidget {
  final color = Colores();
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: color.primaryC ,
          
        ),
      ),
    );
  }
}