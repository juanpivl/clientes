

import 'package:flutter/material.dart';
import 'package:pacientes/widgets/widgets.dart';

class  SingleCard extends StatelessWidget {
  final colo = Colores();
  final String dia;
  final nav;

 SingleCard({Key? key, required this.dia, required this.nav}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.all(15),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 3,
        ),
       
        //TODO: cambiar a imagen
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpg'),
            fit: BoxFit.cover,
            opacity: .66,
          ) ,
          borderRadius: BorderRadius.circular(15)
          
          
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dia,
              style: TextStyle(
                  color: colo.letrasC,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
                  const SizedBox(
            height: 20,
          ),
          Container(width: 80,),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, nav);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.food_bank,
                color: Colors.black,
                size: 60,
              ),
            ),
          ),
          
          
        ],
      ),
    );
  }
}