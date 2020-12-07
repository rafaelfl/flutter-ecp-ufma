import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  final String title;
  TelaInicial({Key key, this.title}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Text('Tela Inicial'),
      ),
    );
  }
}
