import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_test_app/blocs/notes/notes_repository.dart';
import 'package:my_test_app/models/note.dart';

part 'notes_states.dart';
part 'notes_events.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc({@required this.notesRepository}) : super(CreateNoteInitialized());
  NotesRepository notesRepository;
  List<Note> listOfNotes = [];

  @override
  Stream<NotesState> mapEventToState(NotesEvent event) async* {
    if (event is CreateNote) {
      yield* _mapCreateNoteToState(event);
    } else if (event is LoadNotes) {
      yield* _mapLoadNotes(event);
    }
  }

  Stream<NotesState> _mapCreateNoteToState(CreateNote event) async* {
    yield CreatingNote();
    if (await notesRepository.createNote(event.note)) {
      yield NoteCreated();
    }
    yield NoteCreationFailed();
  }

  Stream<NotesState> _mapLoadNotes(LoadNotes event) async* {
    yield LoadingNotes();
    listOfNotes = await notesRepository.loadNotes();
    yield NotesLoaded(notes: listOfNotes);
  }
}
