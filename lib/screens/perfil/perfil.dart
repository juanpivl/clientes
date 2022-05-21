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
    return Material(
      child: StreamBuilder<UserData>(
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
                          margin: const EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                              color: const Color(0xfff9e79f),
                              borderRadius: BorderRadius.circular(15)),
                          height: 600,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 5,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, 'settings');
                                          },
                                          icon: const Icon(Icons.edit_outlined,
                                              color: Colors.black),
                                        )),
                                    Center(
                                      child: Container(
                                        child: const CircleAvatar(
                                          radius: 70,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: const AssetImage(
                                              'assets/logo.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                _perfilBody(userData),
                                _Informacion(userData),
                                GestureDetector(
                                  onTap: () {
                                    _auth.signOut();
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      'Cerrar sesion',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    height: 50,
                                    width: 400,
                                    margin: EdgeInsets.only(
                                        top: 120, left: 20, right: 20),
                                    decoration: BoxDecoration(
                                        color: Color(0xffD0ECE7),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                )
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
      ),
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'settings');
                },
                child: DatosBubble(dato: 'Peso', text: '${userData?.peso} kg'),
              ),
              SizedBox(width: 5),
              GestureDetector(
                child:
                    DatosBubble(dato: 'Altura', text: '${userData?.Altura}M'),
                onTap: () {
                  Navigator.pushNamed(context, 'settings');
                },
              ),
              SizedBox(width: 5),
              GestureDetector(
                child: DatosBubble(dato: 'IMC', text: '${userData?.edad}'),
                onTap: () {
                  Navigator.pushNamed(context, 'settings');
                },
              ),
              SizedBox(width: 5),
              GestureDetector(
                child: DatosBubble(dato: 'Edad', text: '${userData?.celular}'),
                onTap: () {
                  Navigator.pushNamed(context, 'settings');
                },
              ),
              SizedBox(width: 5),
            ],
          ),
        ));
  }

  _Informacion(UserData? userData) {
    return Container(
        child: Column(
      children: [
        PageTitle(
          title: '${userData?.name}',
          text: 'Proxima cita: ',
        ),
        Text('${userData?.cita}')
      ],
    ));
  }
}
