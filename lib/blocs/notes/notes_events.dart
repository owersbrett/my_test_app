part of 'notes_bloc.dart';

abstract class NotesEvent {
  NotesEvent({@required this.note});

  Note note;

  List<Object> get props => [note];
}

class CreateNote extends NotesEvent {
  CreateNote({@required this.note});

  Note note;

  List<Object> get props => [note];
}
class LoadNotes extends NotesEvent {

}
