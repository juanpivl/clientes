import 'package:flutter/material.dart';
import 'package:pacientes/widgets/widgets.dart';


class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  


  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
      child: Column(children: [
        
        const Padding(
          padding: EdgeInsets.all(
            8.0,
          ),
          child:
              const Text("Ingresa tu cuenta", style: TextStyle(color: Colors.white)),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _emailEditingController,
                data: Icons.mail,
                hintText: "Email",
                isObsecure: false, validator: (value) {  },
              ),
              CustomTextField(
                controller: _passwordEditingController,
                data: Icons.password,
                hintText: "Contraseña",
                isObsecure: true, validator: (value) {  },
              ),
            ],
          ),
        ),
        RaisedButton(
          onPressed: () async{
          

            // User? user = await loginUsingEmailPassword(email: _emailEditingController.text, password: _passwordEditingController.text, context: context);
            //     if(user != null){
            //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MenuScreen() ));
            //       print(user.uid);
            //     }
                  
                  
          },
          color: Colors.green,
          child: const Text(
            "Entrar",
            style: const TextStyle(color: Colors.white),
          ),
        ),

        RaisedButton(
          onPressed: () async{
            

          },
          color: Colors.green,
          child: const Text(
            "Anonymus",
            // ignore: unnecessary_const
            style: const TextStyle(color: Colors.white),
          ),
        ),
         
        const SizedBox(height: 30.0),
        Container(height: 4.0, width: _screenWidth * 0.8, color: Colors.white),
        const SizedBox(height: 10.0),
        FlatButton.icon(
          onPressed: () => (){},
          icon: (const Icon(Icons.nature_people, color: Colors.white)),
          label: const Text(
            "Admin",
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    ));
  }

}