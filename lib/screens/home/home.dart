import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            ListView(children: [
              PageTitle(title: 'Bienvenidos', text: 'Nutricion para todos'),
              SizedBox(height: 20.0),
              _VerticalDietas(),
            
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

  

  SingleChildScrollView _VerticalDietas() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _SingleCard(
            color: Colors.blueAccent,
            icon: Icons.fastfood,
            text: 'Lunes',
            nav: 'desayuno',
          ),
          _SingleCard(
            color: Colors.purpleAccent,
            icon: Icons.fastfood,
            text: 'Martes',
            nav: 'comida',
          ),
          _SingleCard(
            color: Colors.pinkAccent,
            icon: Icons.fastfood,
            text: 'Miercoles',
            nav: 'cena',
          ),
          _SingleCard(
            color: Colors.greenAccent,
            icon: Icons.fastfood,
            text: 'Jueves',
            nav: 'colacion',
          ),
           _SingleCard(
            color: Colors.greenAccent,
            icon: Icons.fastfood,
            text: 'Viernes',
            nav: 'colacion',
          ),
           _SingleCard(
            color: Colors.greenAccent,
            icon: Icons.fastfood,
            text: 'Sabado',
            nav: 'colacion',
          ),
           _SingleCard(
            color: Colors.greenAccent,
            icon: Icons.fastfood,
            text: 'Domingo',
            nav: 'colacion',
          ),
        ],
      ),
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String nav;

  const _SingleCard(
      {Key? key,
      required this.icon,
      required this.color,
      required this.text,
      required this.nav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, nav);
            },
            child: CircleAvatar(
              backgroundColor: color,
              child: Icon(
                icon,
                size: 45,
              ),
              radius: 45,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
