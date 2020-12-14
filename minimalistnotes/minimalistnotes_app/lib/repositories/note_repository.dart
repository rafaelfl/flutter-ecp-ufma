import 'package:minimalistnotes_app/interfaces/note_repository_interface.dart';
import 'package:minimalistnotes_app/models/note_model.dart';
import 'package:minimalistnotes_app/models/tag_model.dart';

class NoteRepository implements INoteRepository{
  @override
  Future<List<Note>> getAllNotes() {
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }

  @override
  Future<List<Tag>> getAllTags() {
    // TODO: implement getAllTags
    throw UnimplementedError();
  }

}