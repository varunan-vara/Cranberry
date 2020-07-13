import 'package:cranberry/components/AppBar.dart';
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
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditHomeFeed()),
                );
              },
            ),
            ListTile(
              title: Text("Notification Settings"),
              subtitle: Text("Opens Settings App"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditNotif()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Report Issue"),
              subtitle: Text("If you spot an issue, please let us know here!"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IssuePage()),
                );
              },
            ),
            ListTile(
              title: Text("Leave a Rating"),
              subtitle: Text("A Rating on the App Store would be very helpful!"),
              onTap: (){

              },
            ),
          ],
        ),
      ),
    );
  }
}

class Divider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(126, 168, 190, 1),
      height: .9,
      width: 500,
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
      appBar: AppBar(
        elevation: 0,
        title: Text("Edit Home Screen"),
      ),
    );
  }
}

class EditNotif extends StatefulWidget{
  Notif createState() => Notif();
}

class Notif extends State<EditNotif> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Notification Settings"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("Edit Notification Settings"),
            subtitle: Text("This will redirect you to the settings page"),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}

class IssuePage extends StatefulWidget{
  Issue createState() => Issue();
}

class Issue extends State<IssuePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Report an Issue"),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}