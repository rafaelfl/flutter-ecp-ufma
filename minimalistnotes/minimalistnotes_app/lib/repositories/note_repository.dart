import 'dart:convert';

import 'package:minimalistnotes_app/interfaces/note_repository_interface.dart';
import 'package:minimalistnotes_app/models/note_model.dart';
import 'package:minimalistnotes_app/models/tag_model.dart';
import 'package:minimalistnotes_app/shared/const_api.dart';
import 'package:http/http.dart' as http;

class NoteRepository implements INoteRepository {
  @override
  Future<List<Note>> getAllNotes() async {
    try {
      // ignore: deprecated_member_use
      List<Note> listNote = List();
      final response = await http.get(ConstApi.GET_NOTES);
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
  Future<List<Tag>> getAllTags() {
    // TODO: implement getAllTags
    throw UnimplementedError();
  }

  @override
  Future<Note> getaNote() {
    // TODO: implement getaNote
    throw UnimplementedError();
  }

  @override
  Future<Tag> getaTag() {
    // TODO: implement getaTag
    throw UnimplementedError();
  }
}
