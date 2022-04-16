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
  const _tabcontroller({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
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
              title: const Text(
                "NutriApp",
                style: TextStyle(
                    fontSize: 55, color: Colors.white, fontFamily: "Signatra"),
              ),
              centerTitle: true,
              bottom: const TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  // ignore: unnecessary_const
                  const Tab(
                    icon: Icon(Icons.lock, color: Colors.white),
                    text: "Login",
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
            )));
  }
}