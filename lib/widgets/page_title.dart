import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {

  final String text;
  final String title;

  const PageTitle({Key? key, required this.text, required this.title}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric( horizontal: 20),
        child: Customtitle(),
      ),
    );
  }

  Column Customtitle() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          SizedBox( height: 30 ),
          Text(title, style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white )),
          SizedBox( height: 10 ),
          Text(text, style: TextStyle( fontSize: 16, color: Colors.black )),
        ],
      );
  }
}