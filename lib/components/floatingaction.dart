import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {

  Color main;
  Color background;
  ActionButton(this.background, this.main);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: background,
      child: Icon(Icons.add, color: main,),
    );
  }
}

class NewPage extends StatefulWidget {
  ForwardPage createState() => ForwardPage();
}

class ForwardPage extends State<NewPage> {
  //how to deal with the additions and stuff
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}