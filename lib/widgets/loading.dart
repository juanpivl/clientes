import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';

class Loading extends StatelessWidget {
  final colo = Colores();
  
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Container(
      color: colo.primaryC,
      child: Column(
        children: [
          Text('Solo disponible para usuarios'),
          Center(
            child: SpinKitChasingDots(
              color: colo.secondaryC,
              size: 50.0,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app_outlined, color: Colors.black,),
            onPressed: () {
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
