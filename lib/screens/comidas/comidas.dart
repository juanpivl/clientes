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
              SingleCard(
                dia: 'Lunes',nav: 'lunes',
              ),
              SingleCard(dia: 'Martes',nav: 'martes',),
               SingleCard(dia: 'Miercoles',nav: 'miercoles',),
               SingleCard(dia: 'Jueves',nav: 'jueves',),
               SingleCard(dia: 'Viernes',nav: 'viernes',),
               SingleCard(dia: 'Sabado',nav: 'sabado',),
               SingleCard(dia: 'Domingo',nav: 'domingo',),
            ])
          ],
        ),
      ),
    );
  }
}




