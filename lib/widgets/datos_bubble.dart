import 'package:flutter/material.dart';

class DatosBubble extends StatelessWidget {
  const DatosBubble({Key? key, required this.text,required this.dato}) : super(key: key);

  final String text;
  final String dato;

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
                    color: Colors.white),
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          
          )
          
          ),
    ]);
  }
}

BoxDecoration _buildBoxdecoration() {
  return BoxDecoration(
    color: Color.fromARGB(255, 4, 222, 12),
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
