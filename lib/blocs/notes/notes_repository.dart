import 'package:my_test_app/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesRepository {
  SharedPreferences sharedPreferences;

  Future<bool> createNote(Note note) async {
    print('creating note...');
    sharedPreferences = await SharedPreferences.getInstance();
    List<String> noteStrings = [
      note.userId,
      note.createDate.toString(),
      note.body,
      note.title,
      note.noteId,
    ];

    String userId = sharedPreferences.getString('userId');

    List<String> listOfNoteIds = sharedPreferences.getStringList(userId);
    if (listOfNoteIds != null) {
      listOfNoteIds.add(note.noteId);
      await sharedPreferences.setStringList(userId, listOfNoteIds);
    } else {
      await sharedPreferences.setStringList(userId, [note.noteId]);
    }

    return await sharedPreferences.setStringList(note.noteId, noteStrings);
    // store note on shared preferences / firebase
  }

  Future<List<Note>> loadNotes() async {
    List<Note> notes = [];
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userId', '0');
    String userId = sharedPreferences.getString('userId');
    List<String> listOfNoteIds = sharedPreferences.getStringList(userId);

    // sharedPreferences.getStringList(key)
    if (listOfNoteIds != null) {
      listOfNoteIds.forEach((noteId) async {
        print(noteId.toString());
        notes.add(Note.fromStringList(sharedPreferences.getStringList(noteId)));
      });
    }
    return notes;
    // store note on shared preferences / firebase
  }
}
