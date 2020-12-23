import 'package:minimalistnotes_app/models/note_model.dart';

abstract class INoteRepository {
  Future<List<Note>> getAllNotes();
  Future<Note> getaNote();
}
