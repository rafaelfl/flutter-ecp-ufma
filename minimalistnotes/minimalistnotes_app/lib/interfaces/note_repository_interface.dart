import 'package:minimalistnotes_app/models/note_model.dart';
import 'package:minimalistnotes_app/models/tag_model.dart';

abstract class INoteRepository {
  Future<List<Note>> getAllNotes();
  Future<List<Tag>> getAllTags();
  Future<Note> getaNote();
  Future<Tag> getaTag();
}
