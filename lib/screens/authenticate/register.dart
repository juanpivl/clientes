import 'package:flutter/material.dart';
import 'package:pacientes/services/services.dart';


class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
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
          child: Text("Registra tu cuenta",
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
                validator: (val) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(val ?? '')
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
                validator: (val) {
                return (val != null && val.length >= 6)
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
              child: Text('Registrar'),
              onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _auth.registerWithEmail(email, password);
                    if(result == null){
                      setState(() => error = 'Ingresar un email valido');
                    }
                  }
              }, 
               ),
            const SizedBox(height: 20.0),
            
          ],
          ),
        ),
        Center(child: Text(error,style: TextStyle(color: Colors.red,fontSize: 14),))
      ]),
    ));
  }

}