import 'package:flutter/material.dart';

class Ingrediente extends StatelessWidget {
  final String title;
  Ingrediente({Key key, this.title}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Text('Tela de ingrediente'),
      ),
    );
  }
}