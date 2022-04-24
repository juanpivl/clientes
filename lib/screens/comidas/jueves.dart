import 'package:flutter/material.dart';
import 'package:pacientes/widgets/widgets.dart';

class Jueves extends StatefulWidget {
  Jueves({Key? key}) : super(key: key);

  @override
  State<Jueves> createState() => _JuevesState();
}

class _JuevesState extends State<Jueves> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        body: Stack(children: [
          Background(),
          _body(),
        ]),
      ),
    );
  }
}

class _body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(text: '', title: 'Jueves'),
            const SizedBox(height: 20.0),
            _cartaComida(tipo: 'Desayuno', description: 'Huevitos con jamon Huevitos con jamon Huevitos con jamon Huevitos con jamon Huevitos con jamon Huevitos con jamon ',),
            SizedBox(height: 20),
            _cartaComida(tipo: 'Comida', description: 'Huevitos con jamon '),
            SizedBox(height: 20),
            _cartaComida(tipo: 'Cena', description: 'Huevitos con jamon '),
            SizedBox(height: 20),
            _cartaComida(tipo: 'Colacion', description: 'Huevitos con jamon '),
             SizedBox(height: 20),
            
            _cartaComida(tipo: 'Colacion 2', description: 'Huevitos con jamon '),
            SizedBox(height: 20),
            
            _cartaComida(tipo: 'Colacion 3', description: 'Huevitos con jamon '),
          ],
        ),

        ],
       
      ),
    );
  }
}

class _cartaComida extends StatefulWidget {
  final String tipo;
  final String description;

  const _cartaComida({
    Key? key, required this.tipo,required this.description,
  }) : super(key: key);

  @override
  State<_cartaComida> createState() => _cartaComidaState();
}

class _cartaComidaState extends State<_cartaComida> {
  //TODO: Vincular is checking con base de datos
  bool isChecking =  false;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 350,
      height: MediaQuery.textScaleFactorOf(context) * 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                offset: Offset(0, 0))
          ]),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.tipo,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Checkbox(value: isChecking, onChanged: (bool? value) {
                    setState(() {
                      isChecking = !isChecking;
                    
                    });
                  })
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text( widget.description),
              )
            ],
          ),
        ],
      ),
    );
  }
}
