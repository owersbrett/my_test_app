import 'dart:convert';
import 'package:flutter/material.dart';

class Note {
  final String userId;
  final DateTime createDate;
  final String noteId;
  String title;
  String body;

  Note({
    @required this.userId,
    @required this.createDate,
    @required this.body,
    @required this.title,
    @required this.noteId,
  });

  static Note fromStringList(List<String> stringList) {
    return Note(
      userId: stringList[0],
      createDate: DateTime.parse(stringList[1]),
      body: stringList[2],
      title: stringList[3],
      noteId: stringList[4],
    );
  }

  // DateTime updateDate;
}
