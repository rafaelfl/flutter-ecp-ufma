import 'package:minimalistnotes_app/models/note_model.dart';
import 'package:minimalistnotes_app/repositories/note_repository.dart';
import 'package:mobx/mobx.dart';
part 'note_controller.g.dart';

class NoteController = _NoteControllerBase with _$NoteController;

abstract class _NoteControllerBase with Store {
  NoteRepository _noteRepository;
  _NoteControllerBase() {
    _noteRepository = NoteRepository();
  }

  @observable
  ObservableList<Note> listNote;

  @action
  loadNotes() async {
    listNote = ObservableList<Note>.of(await _noteRepository.getAllNotes());
  }
}
