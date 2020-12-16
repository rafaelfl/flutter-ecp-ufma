import 'package:flutter/material.dart';
import 'package:minimalistnotes_app/controllers/note_controller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NoteController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = NoteController();
    _noteController.loadNotes();
  }

  @override
  Widget build(BuildContext context) {
      return Container();
  }
}
