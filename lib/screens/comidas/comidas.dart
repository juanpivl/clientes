// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/home/setting.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Comidas extends StatefulWidget {
  @override
  State<Comidas> createState() => _ComidasState();
}

class _ComidasState extends State<Comidas> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Clientes?>(context);

    return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Background(),
            ListView(children: [
              PageTitle(title: 'Mis dietas', text: 'Nutricion para todos'),
              SizedBox(height: 20.0),
              _SingleCard(dia: 'Lunes',),
              _SingleCard(dia: 'Martes'),
              _SingleCard(dia: 'Miercoles'),
              _SingleCard(dia: 'Jueves'),
              _SingleCard(dia: 'Viernes'),
              _SingleCard(dia: 'Sabado'),
              _SingleCard(dia: 'Domingo'),

                                  
            ])
                ],
              ),
            ),
          );
        } 
      
    
}




class _SingleCard extends StatelessWidget {
  final String dia;

  const _SingleCard({Key? key, required this.dia}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( dia,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              comidas(tipo: 'Desayuno',description: 'Huevito con jamon',),
              comidas(tipo: 'Comida',description: 'Pizza con pizza',),
              comidas(tipo: 'Cena',description: 'Frijoles',),
              comidas(tipo: 'Colacion',description: 'Frutita motherfucker',),
            ],
            
          ),
          
        ],
      ),
    );
  }

}


class comidas extends StatelessWidget {
  final String tipo;
  final String description;
  const comidas({Key? key,required this.tipo, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 80,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
         Icon(Icons.food_bank, color: Colors.white, size: 30,),
          Text(tipo,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
          Text(description,style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

