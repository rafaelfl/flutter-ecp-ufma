import 'package:flutter/material.dart';

class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Note'),
        ),
        body: Container(
          child: Text('Nova Nota'),
        ));
  }
}
