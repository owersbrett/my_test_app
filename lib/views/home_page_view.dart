import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_app/blocs/navigation/navigation_bloc.dart';

import 'create_note_page.dart';
import 'home_page.dart';

class HomePageView extends StatelessWidget {
  ThemeData get notesTheme => ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  Widget get loading => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: notesTheme,
      home: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: SafeArea(
          child: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (navigationContext, navigationState) {
              if (navigationState is HomePageState) return HomePage();
              if (navigationState is CreateNoteState) return CreateNotePage();
              return loading;
            },
          ),
        ),
      ),
    );
  }
}
