import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/manoz.jpg')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Hola! como estas \n"
              " Made with Love by \n ManozMHrzn",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
