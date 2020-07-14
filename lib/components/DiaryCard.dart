import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  Image first;
  String date;
  String title;
  int rating;

  DiaryCard(this.first, this.date, this.title, this.rating);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(126, 168, 190, 1),
      child: Row(
        children: <Widget>[

        ],
      ),
    );
  }
}