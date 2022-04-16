
import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/services/services.dart';
import 'package:provider/provider.dart';

class ClientesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    final clientes = Provider.of<List<Usuario?>>(context) ;


    if(clientes != null){
      clientes.forEach((cliente) {
      print(cliente!.name);
      print(cliente.peso);
      print(cliente.Altura);
      print(cliente.edad);
      print(cliente.cita);
      print(cliente.celular);
      
    });
    }
    
    
    
  
     

    return Container(child: 
    IconButton(
              icon: const Icon(Icons.exit_to_app_outlined, color: Colors.white),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
    
    );
  }
}