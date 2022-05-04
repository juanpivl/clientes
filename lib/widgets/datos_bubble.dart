import 'package:flutter/material.dart';
import 'package:pacientes/widgets/widgets.dart';

class DatosBubble extends StatelessWidget {
 DatosBubble({Key? key, required this.text,required this.dato}) : super(key: key);

  final String text;
  final String dato;
  final colo = Colores();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          width: 90,
          height: 100,
          decoration: _buildBoxdecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dato,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colo.letrasC),
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colo.letrasC),
              ),
            ],
          
          )
          
          ),
    ]);
  }
}

BoxDecoration _buildBoxdecoration() {
   final colo = Colores();
  return BoxDecoration(
    color:colo.primaryC ,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 10),
      ),
    ],
  );
}
