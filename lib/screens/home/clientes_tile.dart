


// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';

class ClientesTile extends StatelessWidget {

 final usuario = Usuario(
    name: 'Juan',
    peso: '80',
    Altura: '1.80',
    edad: '20',
    cita: 'Cita',
    celular: '123456789',
  );

  



  
  @override
  Widget build(BuildContext context) {
    return    Padding(
          padding:  EdgeInsets.only(top: 8),
          child:  Card(
            margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
            // ignore: unnecessary_const
            child:   ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
              ),
              title: Text('${usuario.name}'),
              
              
              
            ),
          ),
          
        );
      
  }
}