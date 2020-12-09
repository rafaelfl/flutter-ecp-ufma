import 'package:flutter/material.dart';

class ResultView extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      if (arguments != null) print(arguments['totalPrice']);
    return Container();
  }
}
