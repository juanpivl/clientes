import 'package:flutter/material.dart';
import 'package:pacientes/screens/screen.dart';
import 'package:pacientes/widgets/widgets.dart';

class Authenticate extends StatefulWidget {

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return _tabcontroller();
  }
}


class _tabcontroller extends StatelessWidget {
  
final colo = Colores();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  
                  decoration: BoxDecoration(
                      color: colo.primaryC,
                  ),
                ),
                toolbarHeight: 120,
                title: Column(
                  
                  children: [
                    SizedBox(height: 20),
                    Center(child: Image.asset('assets/logo.png', height: 150,fit: BoxFit.cover,)),
                    

                ],),
                
                bottom:  TabBar(

                  indicatorColor: colo.secondaryC,
                  tabs: [
                    
                     Tab(
                      icon: Icon(Icons.lock, color: Colors.black),
                      text: "Ingresar",
                    ),
                    Tab(
                      icon: Icon(Icons.lock, color: Colors.black),
                      text: "Registrarse",
                    ),
                  ],
                  indicatorWeight: 5.0,
                ),
              ),
              body: Container(
                
                decoration: BoxDecoration(
                    color: colo.primaryC
                   ),
                child: TabBarView(
                  children: [
                    SignIn(),
                    Register(),
                  ],
                ),
              )),
        ));
  }
}