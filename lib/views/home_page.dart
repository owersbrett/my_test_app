import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_app/blocs/navigation/navigation_bloc.dart';

class HomePage extends StatelessWidget {
  void goToCreateNotesPage(context) {
    BlocProvider.of<NavigationBloc>(context).add(
      NavigateTo(destination: NavigationViewsEnum.createNoteView),
    );
  }

  AppBar notesAppBar(context) => AppBar(
        title: Text("Brett"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notesAppBar(context),
      body: Container(
        child: Text('Hi I\'m the home page!'),
      ),
    );
  }
}
