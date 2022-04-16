import 'package:flutter/material.dart';
import 'package:pacientes/screens/screen.dart';

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
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 5, 94, 17), Color.fromARGB(255, 77, 136, 11)],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  )),
                ),
                toolbarHeight: 120,
                title: Column(
                  
                  children: [
                    SizedBox(height: 20),
                    Center(child: Image.asset('assets/logo.png', height: 150,fit: BoxFit.cover,)),
                    

                ],),
                
                bottom: const TabBar(

                  indicatorColor: Colors.white,
                  tabs: [
                    // ignore: unnecessary_const
                    const Tab(
                      icon: Icon(Icons.lock, color: Colors.white),
                      text: "Ingresar",
                    ),
                    Tab(
                      icon: Icon(Icons.lock, color: Colors.white),
                      text: "Registrarse",
                    ),
                  ],
                  indicatorWeight: 5.0,
                ),
              ),
              body: Container(
                // ignore: duplicate_ignore
                decoration: const BoxDecoration(
                    // ignore: unnecessary_const
                    gradient: const LinearGradient(
                  colors: [const Color.fromARGB(255, 5, 94, 17), const Color.fromARGB(255, 77, 136, 11)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
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