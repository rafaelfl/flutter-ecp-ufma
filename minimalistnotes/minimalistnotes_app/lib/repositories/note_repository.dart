import 'dart:convert';

import 'package:minimalistnotes_app/interfaces/note_repository_interface.dart';
import 'package:minimalistnotes_app/models/note_model.dart';
import 'package:minimalistnotes_app/shared/const_api.dart';
import 'package:http/http.dart' as http;

class NoteRepository implements INoteRepository {
  @override
  Future<List<Note>> getAllNotes() async {
    try {
      // ignore: deprecated_member_use
      List<Note> listNote = List();
      final response = await http.get(ConstApi.NOTES);
      // Validação básica
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listNote.add(Note.fromJson(item)));
        return listNote;
      } else {
        print("Erro ao carregar lista: " + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista: " + stacktrace.toString());
      return null;
    }
  }

  @override
  Future<void> deleteNote(int id) async {
    try {
      final response = await http.delete(ConstApi.NOTES + '/${id}');
      // Validação básica
      if (response.statusCode == 200) {
        return;
      } else {
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao deletar nota: " + stacktrace.toString());
      return null;
    }
  }

  @override
  Future<void> newNote(int id, String title, String body) async {
    try {
      final response = await http.post(ConstApi.NOTES,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, dynamic>{'id': id, 'title': title, 'body': body}));
      // Validação básica
      if (response.statusCode == 200) {
        return;
      } else {
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao deletar nota: " + stacktrace.toString());
      return null;
    }
  }
}
