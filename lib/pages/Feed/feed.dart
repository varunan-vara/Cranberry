import 'package:flutter/material.dart';
import '../../godfile.dart';
import './../../components/bar.dart';
import './../../components/floatingaction.dart';

class MainFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(20),
      child:SingleChildScrollView(
        child: ConstrainedBox(
      constraints: BoxConstraints(

    ),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TipOfTheDay(size.width),
                Divider(),
                SleepStats(),
                Divider(),
                DoneDiaryFalse(size.width),
                NothingHere(),
          ],
        ),
          ),
      ),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Text(" "),
    );
  }
}

class TipOfTheDay extends StatelessWidget {
  var wideness;
  TipOfTheDay(this.wideness);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(
          blurRadius: 5,
          color: Color.fromRGBO(40, 83, 107, 1),
        ),]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/Images/lightbulb.png",
            height: 80,
            width: 80,
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            width: wideness * .5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Tip:", style: TextStyle(fontSize: 25,),),
                Text(
                  "\nThis will be a place for tips and stuff. Idk whats going here yet...",
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}

class SleepStats extends StatefulWidget {
  Sleeper createState() => Sleeper();
}

class Sleeper extends State<SleepStats>{
  @override
  Widget build(BuildContext context) {
    if (showSleep) {
      return Container(
        width: 2000,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(
              blurRadius: 5,
              color: Color.fromRGBO(40, 83, 107, 1),
            ),]
        ),
        child: Container(
          child: SleepBar(),
        ),
      );
    } else {
      return Container();
    }
  }
}

class DoneDiaryFalse extends StatelessWidget {

  var wideness;
  DoneDiaryFalse(this.wideness);

  @override
  Widget build(BuildContext context) {
    if (showDiary) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(
              blurRadius: 5,
              color: Color.fromRGBO(40, 83, 107, 1),
            ),]
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("assets/Images/clock.png",
                  height: 80,
                  width: 80,
                ),
                Container(
                  margin: EdgeInsets.only(left: 7),
                  padding: EdgeInsets.only(left: 5),
                  width: wideness * .5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Reminder:", style: TextStyle(fontSize: 25,),),
                      Text(
                        "\nYou haven't written a diary entry today! It only takes 5 minutes:\n",
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: FlatButton(
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
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color.fromRGBO(126, 168, 190, 1))
                  ),
                  child: Text("Tap here!",
                    style: TextStyle(color: Color.fromRGBO(126, 168, 190, 1)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

class NothingHere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!showSleep && !showDiary) {
      return Center(
        child: Text("There's nothing else here!"),
      );
    } else {
      return Center();
    }
  }
}