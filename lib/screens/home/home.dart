import 'package:flutter/material.dart';
import 'package:pacientes/services/services.dart';
import 'package:pacientes/widgets/widgets.dart';

class Home extends StatelessWidget {
  
  final AuthService _auth = AuthService();

   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    child: _info( context),
                  ),
                ),
                
                const SizedBox(height: 80),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _info(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Positioned(
              top: 0,
              left: 5,
              child: IconButton(
                icon: const Icon(Icons.exit_to_app_outlined, color: Colors.white),
                onPressed: () async{
                  await _auth.signOut(); 
               

                },
              ),
            ),
            
            Center(
              child: Container(
                child: const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  backgroundImage: const AssetImage('assets/logo.png'),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 315,
          child: Text('das'),
        ),
          
      ]
              
    );
}}