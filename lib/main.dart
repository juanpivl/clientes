import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:pacientes/screens/wrapper.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Color =Colores();

  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Clientes?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.secondaryC,
          primarySwatch: Colors.amber
          
        
        ),
        
        initialRoute: 'Wrapper',
        routes: {
          'Wrapper': (context) => Wrapper(),
          'settings': (context) => Settings(),
          'lunes': (context) => Lunes(),
          'martes': (context) => Martes(),
          'miercoles': (context) => Miercoles(),
          'jueves': (context) => Jueves(),
          'viernes': (context) => Viernes(),
          'sabado': (context) => Sabado(),
          'domingo': (context) => Domingo(),
        },
      ),
    );
  }
}

