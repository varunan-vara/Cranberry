import 'package:cranberry/godfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

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

  bool sleepView = true;
  bool diaryView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Edit Home Screen"),
      ),
      body: Column(
        children: <Widget>[
          SwitchListTile(
            activeTrackColor: Color.fromRGBO(126, 168, 190, 1),
            inactiveTrackColor: Color.fromRGBO(126, 168, 190, 0.8),
            activeColor: Color.fromRGBO(40, 83, 107, 1),
            inactiveThumbColor: Color.fromRGBO(40, 83, 107, 0.8),
            value: sleepView,
            title: Text("Show Sleeping Statistics"),
            onChanged: (value) {
              setState(() {
                sleepView = value;
              });
              changeSleep(value);
              },
          ),
          SwitchListTile(
            activeTrackColor: Color.fromRGBO(126, 168, 190, 1),
            inactiveTrackColor: Color.fromRGBO(126, 168, 190, 0.8),
            activeColor: Color.fromRGBO(40, 83, 107, 1),
            inactiveThumbColor: Color.fromRGBO(40, 83, 107, 0.8),
            value: diaryView,
            title: Text("Show Personal Diary"),
            onChanged: (value) {
              setState(() {
                diaryView = value;
              });
              changeDiary(value);
              },
          ),
        ],
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
            onTap: () {
              AppSettings.openLocationSettings();
            }
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