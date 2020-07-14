import 'package:flutter/material.dart';

AppBar myAppBar(context){
  return AppBar(
    elevation: 0,
    leading: IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Icon(Icons.menu),
      onPressed: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AccountDialog();
        });
      },
    ),
  );
}

class AccountDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SimpleDialog(
      title: Align(alignment: Alignment.centerLeft, child: Text("Account Settings", style: TextStyle(color: Color.fromRGBO(40, 83, 107, 1)),),),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(7),
                child: Card(
                  color: Colors.grey[100],
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/240_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg"),
                        height: 40,
                        width: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child:  Text("Joe Schmoe"),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Log Out", style: mainOption()),
                ),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Manage Account", style: mainOption()),
                  )
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop(true);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Cancel", style: quitOption()),
                  )
              ),
            ],
          ),
        )
      ],
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