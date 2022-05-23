import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pacientes/widgets/widgets.dart';


class Lunes extends StatelessWidget {
  final controller = TextEditingController();

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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // floatingActionButton:  FloatingActionButton(onPressed: () {
        //     final tipo = controller.text;
        //     final descripcion = controller.text;
    
        //     createDietaLunes(tipo: tipo, description: descripcion);
        //   }),
        body: Stack(children: [
          Background(),
          //TODO:Activar para crear dietas
          // TextField(
          //   controller: controller,
          // ),
          
          PageTitle(title: 'Lunes',text: ''),
          
          _body(),
          
        ]),
      ),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Container(
        padding: EdgeInsets.all(20),
            child: StreamBuilder<List<LunesDieta>?>(
              stream: readLunesDieta(),
              builder: (context, snapshot) {
                if(snapshot.hasError){
                    return Text('Error ${snapshot.error}' );
                }else if(snapshot.hasData){
                  final lunesDietas = snapshot.data!;
                  return ListView(
                    children: lunesDietas.map(buildLunes).toList(),
                    
                  );
                }else {
                  return Loading();
                }
                
                
              },
            ),
          ),
    );

  }
}

Widget buildLunes(LunesDieta lunesDieta) => Container(
  padding: EdgeInsets.all(10),
  child: _cartaComida(tipo: lunesDieta.tipo, description: lunesDieta.description),
    );

Stream<List<LunesDieta>> readLunesDieta() =>
    FirebaseFirestore.instance.collection('lunes').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => LunesDieta.fromJson(doc.data())).toList());

Future createDietaLunes(
    {required String tipo, required String description}) async {
  final docUser = FirebaseFirestore.instance.collection('lunes').doc();

  final lunesdieta = LunesDieta(
    tipo: tipo,
    description: description,
  );

  final json = lunesdieta.toJson();
  await docUser.set(json);
}

class LunesDieta {
  String id;
  String tipo;
   String description;

  LunesDieta({this.id = '', required this.tipo, required this.description});

  Map<String, dynamic> toJson() => {
        'id': id,
        'tipo': tipo,
        'description': description,
      };

  static LunesDieta fromJson(Map<String, dynamic> json) => LunesDieta(
        id: json['id'],
        tipo: json['tipo'],
        description: json['description'],
      );
}

////////////////

class _cartaComida extends StatefulWidget {
  final String tipo;
  final String description;

  const _cartaComida({
    Key? key,
    required this.tipo,
    required this.description,
  }) : super(key: key);

  @override
  State<_cartaComida> createState() => _cartaComidaState();
}

class _cartaComidaState extends State<_cartaComida> {
  //TODO: Vincular is checking con base de datos
  bool isChecking = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: MediaQuery.textScaleFactorOf(context) * 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 0))
          ]),
      child: Column(
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
              
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.description),
          )
        ],
      ),
    );
  }
}
