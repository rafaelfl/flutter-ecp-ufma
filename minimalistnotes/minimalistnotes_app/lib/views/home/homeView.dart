import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _noteController.loadNotes();
              },
            )
          ],
          title: Text('Minimalist Notes'),
        ),
        body: Container(child: Observer(builder: (context) {
          final list = _noteController.listNote;
          return list != null
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/detailView',
                                arguments: list[index].id);
                          },
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              list[index].title,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              list[index].body,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        })));
  }
}
