import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  ActionButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
          height: 45,
          child: Center(
              child: Text(
            this.text,
            style: TextStyle(color: Colors.white),
          )),
          color: Color(0xFF732128)),
      onPressed: this.onPressed,
    );
  }
}
