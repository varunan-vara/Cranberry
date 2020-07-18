import 'package:cranberry/godfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Settings extends StatelessWidget {

  //https://www.flaticon.com/authors/vitaly-gorbachev" title="Vitaly Gorbachev"

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
                showDialog(context: context,
                builder: (BuildContext context) {
                  return Rating();
                });
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

  bool sleepView = showSleep;
  bool diaryView = showDiary;

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
            title: Text("Show Personal Diary Reminder"),
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
  final _formKey = GlobalKey<FormState>();

  var body;
  var subject;

  Future<void> sendEmail() async {
    final Email email = Email(
      body: "An Issue has been reported for CranBerry! \n Issue: " + body,
      subject: 'Cranberry - Issue - ' + subject,
      recipients: ['varunanvara@gmail.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
    print("Successfully Sent Email");
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        title: Text("Report an Issue"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),),
                        fillColor: Color.fromRGBO(126, 168, 190, 0.5),
                        hoverColor: Color.fromRGBO(126, 168, 190, 1),
                        focusColor: Color.fromRGBO(40, 83, 107, 1),
                        hintText: "Brief Description of Issue",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } else {
                          setState(() {
                            subject = value;
                          });
                        }
                        return null;
                      }
                  ),
                  Text(""),
                  TextFormField(
                      decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),),
                        fillColor: Color.fromRGBO(126, 168, 190, 0.5),
                        hoverColor: Color.fromRGBO(126, 168, 190, 1),
                        focusColor: Color.fromRGBO(40, 83, 107, 1),
                        hintText: "Name (Optional)"
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      }
                  ),
                  Text(""),
                  TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),),
                        fillColor: Color.fromRGBO(126, 168, 190, 0.5),
                        hoverColor: Color.fromRGBO(126, 168, 190, 1),
                        focusColor: Color.fromRGBO(40, 83, 107, 1),
                        hintText: "Details Regarding the Issue",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } else {
                          setState(() {
                            body = value;
                          });
                        }
                        return null;
                      }
                  ),
                  FlatButton(
                    child: Text("Done"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Thank you for reporting the issue!"),
                            content: Text("We will do what we can to address the problem"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                  Navigator.pop(context);
                                },
                                child: Text("Done"),
                              ),
                            ],
                          );
                        }
                      );
                      sendEmail();
                    },
                  ),
                ]
            ),
          ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("This App is not on the Play Store!!"),
      content: Text("Try again later"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text("Done"),
        ),
      ],
    );
  }
}