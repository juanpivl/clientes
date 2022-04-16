import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Clientes?>(context);
    print(user);
    


    if(user ==null){
      return Authenticate();
    }else{
      return MenuScreen();
    }
    
  }
}