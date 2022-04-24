

import 'package:flutter/material.dart';

class  SingleCard extends StatelessWidget {
  final String dia;
  final nav;

  const SingleCard({Key? key, required this.dia, required this.nav}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dia,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
                  const SizedBox(
            height: 20,
          ),
          Container(width: 80,),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, nav);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.food_bank,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
          
          
        ],
      ),
    );
  }
}