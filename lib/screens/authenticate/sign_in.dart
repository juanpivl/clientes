import 'package:flutter/material.dart';
import 'package:pacientes/services/auth.dart';
import 'package:pacientes/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

 

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(
            15.0,
          ),
          child: Text("Ingresa tu cuenta",
              style: TextStyle(color: Colors.white,fontSize: 20)),
        ),
        Form(
          child: Column(
            children: [





            const SizedBox(height: 30.0),
            Container(
                height: 4.0, width: _screenWidth * 0.8, color: Colors.white),
            const SizedBox(height: 10.0),
            _anonimus(auth: _auth)
          ]),
        )
      ]),
    ));
  }
}

class _anonimus extends StatelessWidget {
  const _anonimus({
    Key? key,
    required AuthService auth,
  }) : _auth = auth, super(key: key);

  final AuthService _auth;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        dynamic result = await _auth.signInAnon();
        if (result == null) {
          print("error ");
        } else {
          print("entro");
          print(result.uid);
        }
      },
      icon: (const Icon(Icons.nature_people, color: Colors.white)),
      label: const Text(
        "Anonimus",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
