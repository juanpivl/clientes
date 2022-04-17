import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pacientes/services/services.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Text('Solo disponible para usuarios'),
          Center(
            child: SpinKitChasingDots(
              color: Color.fromARGB(255, 4, 154, 81),
              size: 50.0,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app_outlined, color: Colors.white),
            onPressed: () {
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
