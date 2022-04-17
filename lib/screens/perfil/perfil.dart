import 'package:flutter/material.dart';
import 'package:pacientes/models/models.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Perfil extends StatefulWidget {
  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<Clientes?>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData? userData = snapshot.data;
          return Scaffold(
            body: Stack(
              children: [
                Background(),
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(62, 66, 107, 0.7),
                            borderRadius: BorderRadius.circular(15)),
                        height: 500,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 5,
                                    child: IconButton(
                                      icon: const Icon(
                                          Icons.exit_to_app_outlined,
                                          color: Colors.white),
                                      onPressed: () {
                                        _auth.signOut();
                                      },
                                    ),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 5,
                                      child: IconButton(
                                        onPressed: () {
                                          _showSettingPanel(context, userData);
                                        },
                                        icon: const Icon(Icons.edit_outlined,
                                            color: Colors.white),
                                      )),
                                  Center(
                                    child: Container(
                                      child: const CircleAvatar(
                                        radius: 70,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            const AssetImage('assets/logo.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              _perfilBody(userData),

                              _Informacion(userData),
                            ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }

  Container _perfilBody(UserData? userData) {
    return Container(
        width: double.infinity,
        height: 125,
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DatosBubble(dato: 'Peso', text: '${userData?.peso} kg'),
              SizedBox(width: 5),
              DatosBubble(dato: 'Altura', text: '${userData?.Altura}M'),
              SizedBox(width: 5),
              DatosBubble(dato: 'Edad', text: '${userData?.edad}'),
              SizedBox(width: 5),
              DatosBubble(dato: 'Celular', text: '${userData?.celular}'),
              SizedBox(width: 5),
               
            ],
          ),
        ));
  }

  void _showSettingPanel(clientes, index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(

            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Settings(),
          );
        });
  }

  _Informacion(UserData? userData) {
    return Container(
      child: PageTitle(
        title: '${userData?.name}',
        text: 'Prox. cita: ${userData?.cita}',
      ),
    );
  }
}
