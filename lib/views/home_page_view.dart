import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Brett"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('Pass navigation event');
              },
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: Text('this is going to list our notes'),
          ),
        ),
      ),
    );
  }
}
