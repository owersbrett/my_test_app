import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_app/blocs/navigation/navigation_bloc.dart';
import 'package:my_test_app/blocs/notes/notes_bloc.dart';
import 'package:my_test_app/models/note.dart';
import 'package:uuid/uuid.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  TextEditingController titleController;
  TextEditingController notesController;
  FocusNode titleNode;
  FocusNode notesNode;

  @override
  void initState() {
    titleController = TextEditingController(text: "Title");
    notesController = TextEditingController(text: "Notes");
    titleNode = FocusNode()
      ..addListener(() {
        if (titleController.text == "") {
          setState(() {
            titleController.text = "Title";
          });
        } else
        if (titleController.text == "Title") {
          setState(() {
            titleController.text = "";
          });
        }
      });
    notesNode = FocusNode()
      ..addListener(() {

        if (notesController.text == "") {
          setState(() {
            notesController.text = "Notes";
          });
        }else
        if (notesController.text == "Notes") {
          setState(() {
            notesController.text = "";
          });
        }
      });
    super.initState();
  }

  navigateBack(context) {
    BlocProvider.of<NavigationBloc>(context).add(
      NavigateTo(destination: NavigationViewsEnum.homeView),
    );
  }

  saveNote(context) {
    BlocProvider.of<NotesBloc>(context).add(
      CreateNote(
        note: Note(
          userId: "0",
          body: notesController.text,
          createDate: DateTime.now(),
          noteId: Uuid().toString(),
          title: titleController.text,
        ),
      ),
    );
  }

  AppBar createNoteAppbar(context) => AppBar(
        title: Text('Create Note'),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            navigateBack(context);
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createNoteAppbar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              focusNode: titleNode,
              controller: titleController,
            ),
            TextField(
              focusNode: notesNode,
              keyboardType: TextInputType.multiline,
              maxLengthEnforced: false,
              maxLines: 10,
              controller: notesController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          saveNote(context);
          navigateBack(context);
          print('save note');
        },
      ),
    );
  }
}
