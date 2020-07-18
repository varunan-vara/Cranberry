import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './../components/AppBar.dart';
import './../components/floatingaction.dart';

//imports for Navbar
import './Sleep/sleep.dart';
import './Settings/settings.dart';
import './Feed/feed.dart';
import './Diary/diary.dart';

//ThemeData

const kPrimaryColor = Color.fromRGBO(40, 83, 107, 1);
const kTextColor = Color.fromRGBO(126, 168, 190, 1);
const kBackgroundColor = Color.fromRGBO(246, 240, 237, 1);
const double kDefaultPadding = 20.0;

class MyApp extends StatelessWidget {
  //This is the main app Navigation Widget

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "Cranberry",
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Mainpage(),
    );
  }
}


class Mainpage extends StatefulWidget {
  MainState createState() => MainState();
}


class MainState extends State<Mainpage> {

  //Navigation for bottomNavigationBar
  int _currentIndex = 0;


  //homes for navigation bar

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: myAppBar(context),
      backgroundColor: Colors.white,
      body: NotificationListener<OverscrollIndicatorNotification>(
          // ignore: missing_return
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
          },
          child: SingleChildScrollView(
            child: MainBody(_currentIndex),
          ),),
      floatingActionButton: ActionButton(Colors.white, kPrimaryColor),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0,-10),
              blurRadius: 35,
              color: kPrimaryColor.withOpacity(0.38),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: _currentIndex == 0 ? kPrimaryColor : kTextColor,
              onPressed: () {onTabTapped(0);},
            ),
            IconButton(
              icon: Icon(Icons.timer),
              color: _currentIndex == 1 ? kPrimaryColor : kTextColor,
              onPressed: () {onTabTapped(1);},
            ),
            Container(
              width: 30,
            ),
            IconButton(
              icon: Icon(Icons.book),
              color: _currentIndex == 2 ? kPrimaryColor : kTextColor,
              onPressed: () {onTabTapped(2);},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              color: _currentIndex == 3 ? kPrimaryColor : kTextColor,
              onPressed: () {onTabTapped(3);},
            ),
          ],
        )
      ),
    );
  }
}



class MainBody extends StatelessWidget {

  int page;

  MainBody(this.page);

  String currentPage = "Home";

  final List<Widget> _children = [
    MainFeed(),
    SleepFeed(),
    DiaryFeed(),
    Settings()
  ];

  final List<String> _pageNames = [
    "Home",
    "Sleep",
    "Diary",
    "Settings"
  ];

@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height *.1,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: kDefaultPadding),
                height: size.height * .15 - 20,
                color: kPrimaryColor,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(_pageNames[page], style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'Rubik'
                      ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(child: _children[page]),
      ],
    );
  }
}