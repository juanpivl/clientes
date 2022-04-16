import 'package:flutter/material.dart';
import 'package:pacientes/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';


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
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            
            children: [
            const SizedBox(height: 30.0),
            Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColor,
                  ),
                  focusColor: Theme.of(context).primaryColor,
                  hintText: "Correo",
                  
                ),
                autocorrect: false,
                validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El correo no es correcto';
              },
                onChanged: (val) {
                  setState(() {
                    email =val;
                  });
                },
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.password,
                    color: Theme.of(context).primaryColor,
                  ),
                  focusColor: Theme.of(context).primaryColor,
                  hintText: "Contraseña",
                ),
                autocorrect: false,
                obscureText: true,
                validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe ser de 6 caracteres';
              },
                onChanged: (val) {
                  setState(() {
                    
                    password =val;
                  
                  });
                },
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              child: Text('Ingresar'),
              onPressed: ()async {
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Credenciales incorrectas';
                      });
                    }
                  }
              }, 
               ),
            const SizedBox(height: 30.0),
            Container(
                height: 4.0, width: _screenWidth * 0.8, color: Colors.white),
            const SizedBox(height: 10.0),
            _anonimus(auth: _auth)
          ]),
        ),

        Center(child: Text(error,style: TextStyle(color: Colors.red,fontSize: 14),))
      ]
      
      ),
      
    )
    
    );
  }
}

class _anonimus extends StatelessWidget {
  const _anonimus({
    Key? key,
    required AuthService auth,
  })  : _auth = auth,
        super(key: key);

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
