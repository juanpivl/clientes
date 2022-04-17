import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Background(),
          Container(
            margin: EdgeInsets.fromLTRB(5, 5, 10, 10),
             child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.exit_to_app),
              onPressed: () {
                _auth.signOut();
              },),
          ),
          
          Container(
            margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: StreamProvider<List<Usuario?>>.value(
              value: DatabaseService().clientes,
              initialData: [null],
              child: ClientesList(),
            ),
          ),
        ],
      ),
    );
  }
}
