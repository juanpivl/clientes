import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            ListView(children: [
              PageTitle(title: 'Bienvenidos', text: 'Nutricion para todos'),
              SizedBox(height: 20.0),
              dependeDia(),
              SizedBox(height: 20.0),
              CardContainer(
                child: Image.network(
                    'https://media.giphy.com/media/jTUMpZZ5H8IV8GFM0L/giphy.gif'),
              ),
              SizedBox(height: 20.0),
            ])
          ],
        ),
      ),
    );
  }

  CheckboxListTile _buildCheckboxListTile(
    String title,
    bool value,
  ) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: null,
    );
  }
}

class dependeDia extends StatefulWidget {
  @override
  State<dependeDia> createState() => _dependeDiaState();
}

class _dependeDiaState extends State<dependeDia> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    if (date.weekday == 7) {
      return SingleCard(dia: 'Domingo', nav: 'domingo',foto: 'assets/fondo.jpg',);
    } else {
      if (date.weekday == 6) {
        return SingleCard(dia: 'Sabado', nav: 'sabado',foto: 'assets/fondo.1.jpg',);
      } else if (date.weekday == 5) {
        return SingleCard(dia: 'Viernes', nav: 'viernes',foto: 'assets/fondo.2.jpg',);
      } else if (date.weekday == 4) {
        return SingleCard(dia: 'Jueves', nav: 'jueves',foto: 'assets/fondo.3.jpg',);
      } else if (date.weekday == 3) {
        return SingleCard(dia: 'Miercoles', nav: 'miercoles',foto: 'assets/fondo.4.jpg',);
      } else if (date.weekday == 2) {
        return SingleCard(dia: 'Martes', nav: 'martes',foto: 'assets/fondo.5.jpg',);
      } else if (date.weekday == 1) {
        return SingleCard(dia: 'Lunes', nav: 'lunes',foto: 'assets/fondo.6.jpg',);
      } else {
        return SingleCard(dia: 'Ni puta idea que dia es', nav: 'domingo',foto: 'assets/fondo.jpg',);
      }
    }
  }
}
