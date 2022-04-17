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
                    Text(
                      'Actualiza tu perfil',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Nombre',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.name,
                      validator: (input) =>
                          input!.isEmpty ? 'Por favor ingrese su nombre' : null,
                          onChanged: (input) =>
                          setState(() => _currentName = input),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Celular',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.celular,
                      validator: (input) => input!.isEmpty
                          ? 'Por favor ingrese su celular'
                          : null,
                      onChanged: (input) =>
                          setState(() => _currentCelular = input),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Edad',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.edad,
                      validator: (input) =>
                          input!.isEmpty ? 'Por favor ingrese su edad' : null,
                      onChanged: (input) =>
                          setState(() => _currentEdad = input),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Peso',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.peso,
                      validator: (input) =>
                          input!.isEmpty ? 'Por favor ingrese su peso' : null,
                      onChanged: (input) =>
                          setState(() => _currentPeso = input),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Altura',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.Altura,
                      validator: (input) =>
                          input!.isEmpty ? 'Por favor ingrese su altura' : null,
                      onChanged: (input) =>
                          setState(() => _currentAltura = input),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Proxima Cita',
                          labelStyle: TextStyle(color: Colors.white)),
                      initialValue: userData?.cita,
                      validator: (input) => input!.isEmpty
                          ? 'Por favor ingrese su proxima cita'
                          : null,
                      onChanged: (input) =>
                          setState(() => _currentCita = input),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      color: Colors.white,
                      child: Text('Guardar'),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          await DatabaseService(uid:user?.uid).updateUserData(
                            _currentName ?? userData!.name,
                            _currentCelular ?? userData!.celular,
                            _currentEdad ?? userData!.edad,
                            _currentPeso ?? userData!.peso,
                            _currentAltura ?? userData!.Altura,
                            _currentCita ?? userData!.cita,
                          
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
