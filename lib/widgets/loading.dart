import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: SpinKitChasingDots(
          color: Color.fromARGB(255, 4, 154, 81),
          size: 50.0,
        ),
      ),
    );
  }
}
