part of 'notes_bloc.dart';


abstract class NotesState  {
  List<Note> notes;
  NotesState({this.notes});

}

class CreateNoteInitialized extends NotesState {
  
}
class CreatingNote extends NotesState {
  
}
class NoteCreated extends NotesState {


}
class NoteCreationFailed extends NotesState {


}
class LoadingNotes extends NotesState {


}
class NotesLoaded extends NotesState {
  List<Note> notes;
  NotesLoaded({this.notes});


}
