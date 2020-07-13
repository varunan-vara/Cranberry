import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: FractionalOffset.centerLeft,
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text("Edit Home Feed"),
              subtitle: Text("Choose what you want to see on the Home Page"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Notification Settings"),
              subtitle: Text("Opens Settings App"),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}


class EditHomeFeed extends StatefulWidget{
  EditHome createState() => EditHome();
}

class EditHome extends State<EditHomeFeed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}