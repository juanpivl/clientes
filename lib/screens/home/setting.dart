import 'package:flutter/material.dart';
import 'package:pacientes/models/clientes.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();

  String? _currentName;
  String? _currentCelular;
  String? _currentEdad;
  String? _currentPeso;
  String? _currentAltura;
  String? _currentCita;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Clientes?>(context);
    return StreamBuilder<UserData>(
        //Provider.of<UserData>(context).uid
        stream: DatabaseService(uid: user?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Actualiza tu perfil',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Nombre',
                          labelStyle: TextStyle(color: Colors.white)),
                          initialValue: userData?.name,
                          onChanged: (val) {
                          setState(() {
                    
                              _currentName =val;
                  
                            });
                },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Celular',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.celular ,
                      onChanged: (val) {
                        setState(() {
                          _currentCelular = val;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Edad',
                          labelStyle: const TextStyle(color: Colors.white)),
                      initialValue: userData?.edad,
                      onChanged: (val) {
                        setState(() {
                          _currentEdad = val;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Peso',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.peso,
                      onChanged: (val) {
                        setState(() {
                          _currentPeso = val;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Altura',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.Altura,
                      onChanged: (val) {
                        setState(() {
                          _currentAltura = val;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Proxima Cita',
                          labelStyle: const TextStyle(color: Colors.white)),
                      initialValue: userData?.cita,
                      
                      onChanged: (val) {
                        setState(() {
                          _currentCita = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: const Text('Guardar'),
                      onPressed: ()  {
                        if(_formKey.currentState!.validate()){
                           DatabaseService(uid:user?.uid).updateUserData(
                            _currentName ?? userData!.name,
                            _currentPeso ?? userData!.peso,
                            _currentAltura ?? userData!.Altura,
                            
                            _currentEdad ?? userData!.edad,
                            _currentCita ?? userData!.cita,
                            _currentCelular ?? userData!.celular,
                            
                            
                          
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
