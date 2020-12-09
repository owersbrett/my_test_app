import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_app/blocs/navigation/navigation_bloc.dart';
import 'package:my_test_app/blocs/notes/notes_bloc.dart';
import 'package:my_test_app/models/note.dart';

class HomePage extends StatelessWidget {
  void goToCreateNotesPage(context) {
    BlocProvider.of<NavigationBloc>(context).add(
      NavigateTo(destination: NavigationViewsEnum.createNoteView),
    );
  }

  AppBar notesAppBar(context) => AppBar(
        title: Text("Array Notes App"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              goToCreateNotesPage(context);
            },
          ),
        ],
      );
  Widget get notesBody => Container(
        child: Center(
          child: Text('this is going to list our notes'),
        ),
      );

  Widget get loading => Center(
        child: CircularProgressIndicator(),
      );
  Widget get noNotes => Center(
        child: Text("You haven't written any notes!"),
      );

  Widget buildNoteWidget(Note note) => ListTile(
        onTap: () {
          print('this note');
        },
        title: Text(note.title),
        subtitle: Text(note.body),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notesAppBar(context),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is LoadingNotes) return loading;
          if (state is NotesLoaded) {
            if (state.notes.length == 0) return noNotes;
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (ctx, index) => buildNoteWidget(state.notes[index]),
            );
          }
          return noNotes;
        },
      ),
    );
  }
}
