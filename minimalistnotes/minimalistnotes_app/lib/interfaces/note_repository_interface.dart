import 'package:minimalistnotes_app/models/note_model.dart';

abstract class INoteRepository {
  Future<List<Note>> getAllNotes();
  Future<void> deleteNote(int id);
  Future<void> newNote(int id, String title, String body);
}
