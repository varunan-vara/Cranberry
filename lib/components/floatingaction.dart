import 'package:flutter/material.dart';

final List<String> _images = [
  "  assets/veryhappy.svg",
  "assets/happy.svg",
  "assets/neutral.svg",
  "assets/sad.svg",
  "assets/verysad.svg"
];

var feeling = 3;

class ActionButton extends StatelessWidget {

  Color main;
  Color background;
  int option = 0;
  ActionButton(this.background, this.main);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
              return Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: ActionDialog(),
                ),
              );
            },
            transitionDuration: Duration(milliseconds: 200),
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            pageBuilder: (context, animation1, animation2) {});
      },
      backgroundColor: background,
      child: Icon(Icons.add, color: main,),
    );
  }
}

class ActionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(child: Text("Create..."),),
      children: <Widget>[
        FlatButton(
          onPressed: () {Navigator.pop(context, true);Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewDiary()),
          );},
          child: Text("New Diary", style: mainOption()),
        ),
        FlatButton(
          onPressed: () {Navigator.pop(context, true);Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewAlarm()),
          );},
          child: Text("New Alarm", style: mainOption()),
        ),
        FlatButton(
          onPressed: () {Navigator.pop(context, true);},
          child: Text("Cancel", style: quitOption()),
        ),
      ],
    );
  }
}

class NewDiary extends StatefulWidget{
  NuDiary createState() => NuDiary();
}

class NewAlarm extends StatefulWidget{
  NuAlarm createState() => NuAlarm();
}

class NuDiary extends State<NewDiary>{

  final _formKey1 = GlobalKey<FormState>();

  int rating = 2;
  ColorFilter _isSelected(numCheck) {
    if (numCheck == rating) {
      return ColorFilter.mode(
        Colors.transparent,
        BlendMode.saturation,
      );
    } else {
      return ColorFilter.mode(
        Colors.grey,
        BlendMode.saturation,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("New Diary Entry"),
      ),
      body: Form(
        key: _formKey1,
        child: Padding(
          padding: EdgeInsets.all(30),
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
                    hintText: "Diary Title",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    } else {

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
                    hintText: "Location (ie. Work, Home)",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    } else {

                    }
                    return null;
                  }
              ),
              Text(""),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        feeling = 0;
                      });
                    },
                    child: DisablePic(0, Image.asset("assets/verysad.png", height: 70, width: 70,),)
                  ),

                  FlatButton(
                    onPressed: () {
                      setState(() {
                        feeling = 2;
                      });
                    },
                    child: DisablePic(2, Image.asset("assets/neutral.png", height: 70, width: 70,),)
                  ),
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          feeling = 4;
                        });
                      },
                      child: DisablePic(4, Image.asset("assets/veryhappy.png", height: 70, width: 70,),)
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          feeling = 1;
                        });
                      },
                      child: DisablePic(1, Image.asset("assets/sad.png", height: 70, width: 70,),)
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        feeling = 3;
                      });
                    },
                    child: DisablePic(3, Image.asset("assets/happy.png", height: 70, width: 70,),)
                  ),

                ],
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
                    hintText: "Diary Entry",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    } else {

                    }
                    return null;
                  }
              ),
              Text(""),
              FlatButton(
                onPressed: () {},
                child: Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NuAlarm extends State<NewAlarm> {

  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Edit Home Screen"),
      ),
      body: Form(
        key: _formKey2,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[

            ],
          ),
      ),
      ),
    );
  }
}
TextStyle mainOption() {
  return TextStyle(
    color: Color.fromRGBO(40, 83, 107, 1),
    fontWeight: FontWeight.bold,
  );
}

TextStyle quitOption() {
  return TextStyle(
    color: Color.fromRGBO(126, 168, 190, 1),
  );
}

class DisablePic extends StatelessWidget{

  int nump;
  Widget _child;
  DisablePic(this.nump, this._child);

  @override
  Widget build(BuildContext context) {
    if (nump == feeling) {
      return _child;
    } else {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.saturation,
        ),
        child: _child,
      );
    }
  }
}

