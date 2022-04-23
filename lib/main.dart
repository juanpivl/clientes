import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:pacientes/screens/wrapper.dart';
import 'package:pacientes/services/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Clientes?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          primarySwatch: Colors.green,
        ),
        
        initialRoute: 'Wrapper',
        routes: {
          'Wrapper': (context) => Wrapper(),
          'settings': (context) => Settings(),
        },
      ),
    );
  }
}

