import 'package:flutter/material.dart';
import 'package:pacientes/widgets/widgets.dart';

class Comidas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        
      
        body: Stack(
          children: [
            Background(),
            _DietasBody(),
            
          ],
        ),
      ),
    );
  }}

  ListView _DietasBody() {
    return ListView(
      
        children: 

          [
            PageTitle(title: 'Mis Dietas',text: 'Nutricion para todos',),
            SizedBox(height: 20.0),
            
            _SingleCard( color: Colors.blueAccent,icon: Icons.breakfast_dining_outlined,text: 'Lunes',nav: 'desayuno',),
            _SingleCard( color: Colors.purpleAccent,icon: Icons.lunch_dining_outlined,text: 'Martes',nav: 'comida',),
            _SingleCard( color: Colors.pinkAccent,icon: Icons.dinner_dining_outlined,text: 'Miercoles',nav: 'cena',),
            _SingleCard( color: Colors.greenAccent,icon: Icons.food_bank_sharp,text: 'Jueves',nav: 'colacion',),
            _SingleCard( color: Colors.pinkAccent,icon: Icons.dinner_dining_outlined,text: 'Viernes',nav: 'cena',),
            _SingleCard( color: Colors.greenAccent,icon: Icons.food_bank_sharp,text: 'Sabado',nav: 'colacion',),
            _SingleCard( color: Colors.pinkAccent,icon: Icons.dinner_dining_outlined,text: 'Domingo',nav: 'cena',),
          
        ],
      );
  }
  


class _SingleCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;
  final String nav;
  
  const _SingleCard({Key? key, required this.icon, required this.color, required this.text,required this.nav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 220,
      
      decoration: BoxDecoration(color: Color.fromRGBO(62, 66, 107,0.7 ),borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
        GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, nav);
          },
          child: CircleAvatar(
            backgroundColor: color,
            child: Icon(icon,size: 45,),
            radius: 45,
          ),
        ),

        
        

          const SizedBox(height: 10,),
          
          Text(text,style: TextStyle(color: color,fontSize: 18),),
          
        
        ],
      ),);
  }
}