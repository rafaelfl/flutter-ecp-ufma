import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Text('Hello world :)'),
      floatingActionButton: FloatingActionButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/details');
              }
      )
      ),
    );
  }
}

