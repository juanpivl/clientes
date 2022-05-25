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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'lunes');
                },
                child: SingleCard(
                  dia: 'Lunes',
                  nav: 'lunes',
                  foto: 'assets/fondo.1.jpg',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'martes');
                },
                child: SingleCard(
                  dia: 'Martes',
                  nav: 'martes',
                  foto: 'assets/fondo.2.jpg',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'miercoles');
                },
                child: SingleCard(
                  dia: 'Miercoles',
                  nav: 'miercoles',
                  foto: 'assets/fondo.3.jpg',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'jueves');
                },
                child: SingleCard(
                  dia: 'Jueves',
                  nav: 'jueves',
                  foto: 'assets/fondo.4.jpg',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'viernes');
                },
                child: SingleCard(
                  dia: 'Viernes',
                  nav: 'viernes',
                  foto: 'assets/fondo.5.jpg',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'sabado');
                },
                child: SingleCard(
                  dia: 'Sabado',
                  nav: 'sabado',
                  foto: 'assets/fondo.6.jpg',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'domingo');
                },
                child: SingleCard(
                  dia: 'Domingo',
                  nav: 'domingo',
                  foto: 'assets/fondo.jpg',
                ),
              ),

            ])
          ],
        ),
      ),
    );
  }
}
