import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:provider/provider.dart';

class ClientesList extends StatefulWidget {
  @override
  State<ClientesList> createState() => _ClientesListState();
}

class _ClientesListState extends State<ClientesList> {
  
 

  @override
  Widget build(BuildContext context) {

    //este jala informacion
    final clientes = Provider.of<List<Usuario?>>(context); 


    return ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                        color: Color.fromRGBO(62, 66, 107, 0.7),
                        borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.only(top: 50),
                margin: EdgeInsets.all(10),
                child: _perfilcard(clientes, index)),
            );
          },
          itemCount: clientes.length,
        );
  }
  

  Column _perfilcard(List<Usuario?> clientes, int index) {
    return Column(
        children: <Widget>[
          ListTile(
            
            title: Center(
              child: Text(
                ' ${clientes[index]?.name} \n ',
                style: TextStyle(
                  
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Text(
              'Celular: ${clientes[index]?.celular} \n\n Edad: ${clientes[index]?.edad} \n\n Peso: ${clientes[index]?.peso} \n\n Altura: ${clientes[index]?.Altura} \n\n Prox. Cita: ${clientes[index]?.cita} ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            

          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    _showSettingPanel(clientes, index);
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Editar'),
                  
                ),
                
              ],
            ),
          ),
        ],
      );
  }

  void _showSettingPanel(List<Usuario?> clientes, int index) {
    showModalBottomSheet(context: context, builder: (context){
        return Container(
          color: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Settings(),
        );
      });
  }
}



    