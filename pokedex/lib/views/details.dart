import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String title;
  Details({Key key, this.title}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Text('Hello world :)'),
      ),
    );
  }
}
