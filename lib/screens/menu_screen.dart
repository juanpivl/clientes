
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pacientes/screens/screen.dart';

class MenuScreen extends StatefulWidget {

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int pageindex = 0;

 final Home _home = Home();
 final Perfil _perfil = Perfil();
 final Comidas _comidas = Comidas();

  Widget _showPage = Home();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home ;
        
      case 1:
        return _comidas;
        
      case 2:
        return _perfil ;
          
      
         
      default:
        return Home();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        


        bottomNavigationBar: CurvedNavigationBar(
        
          items: const [
            Icon(Icons.home, size: 40),
            Icon(Icons.fastfood, size: 40),
            Icon(Icons.person, size: 40),
          ],
          color: Colors.green,
          backgroundColor:  const Color(0xff202333), 
          buttonBackgroundColor: Colors.green,
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
          
          
         
        ),
        body: Center(child: _showPage),
      ),
    );
  }

}