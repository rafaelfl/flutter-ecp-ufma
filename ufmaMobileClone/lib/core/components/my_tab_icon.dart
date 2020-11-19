import 'package:flutter/material.dart';

class MyTabIcon extends StatelessWidget {
  final IconData myIcon;
  final String myText;

  MyTabIcon({this.myIcon, this.myText});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [Icon(this.myIcon), SizedBox(height: 5), Text(this.myText)]);
  }
}
