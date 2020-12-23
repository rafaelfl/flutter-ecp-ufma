import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minimalistnotes_app/controllers/note_controller.dart';

class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  NoteController _noteController;
  String title;
  String body;
  int id;
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    _noteController = NoteController();
    title = '';
    body = '';
    id = random.nextInt(1000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New Note'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _noteController.addNote(id, title, body);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ]),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Note title'),
                onChanged: (value) async {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note content',
                ),
                onChanged: (value) async {
                  setState(() {
                    body = value;
                  });
                },
              )
            ],
          ),
        ));
  }
}
