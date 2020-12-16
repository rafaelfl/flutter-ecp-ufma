// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoteController on _NoteControllerBase, Store {
  final _$listNoteAtom = Atom(name: '_NoteControllerBase.listNote');

  @override
  ObservableList<Note> get listNote {
    _$listNoteAtom.reportRead();
    return super.listNote;
  }

  @override
  set listNote(ObservableList<Note> value) {
    _$listNoteAtom.reportWrite(value, super.listNote, () {
      super.listNote = value;
    });
  }

  final _$loadNotesAsyncAction = AsyncAction('_NoteControllerBase.loadNotes');

  @override
  Future loadNotes() {
    return _$loadNotesAsyncAction.run(() => super.loadNotes());
  }

  @override
  String toString() {
    return '''
listNote: ${listNote}
    ''';
  }
}
