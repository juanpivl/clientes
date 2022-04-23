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
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Background(),
            ListView(
              children: [
                StreamBuilder<UserData>(
                  //Provider.of<UserData>(context).uid
                  stream: DatabaseService(uid: user?.uid).userData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      UserData? userData = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 80, left: 20, right: 20, bottom: 170),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(62, 66, 107, 0.7),
                              borderRadius: BorderRadius.circular(15)),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Actualiza tu perfil',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      hintText: "Nombre",
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _currentName = val;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      hintText: "Celular",
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _currentCelular = val;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.calendar_today,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      hintText: "Edad",
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _currentEdad = val;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.monitor_weight,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      hintText: "Peso",
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _currentPeso = val;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.height,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      hintText: "Altura en metros",
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _currentAltura = val;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      child: const Text('Guardar'),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          DatabaseService(uid: user?.uid)
                                              .updateUserData(
                                            _currentName ?? userData!.name,
                                            _currentPeso ?? userData!.peso,
                                            _currentAltura ?? userData!.Altura,
                                            _currentEdad ?? userData!.edad,
                                            _currentCita ?? userData!.cita,
                                            _currentCelular ??
                                                userData!.celular,
                                          );
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                    ElevatedButton(
                                      child: const Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Loading();
                    }
                  },
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
