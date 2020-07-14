import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class Bar extends StatelessWidget {

  final double height;
  final String label;

  final int _baseDurationMs = 1000;
  final double _maxElementHeight = 100;

  Bar(this.height, this.label);

  int toInt(number) {
    return (number).round();
  }

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      duration: Duration(seconds: 1),
      tween: 0.0.tweenTo(height/10),
      builder: (context, child, animatedHeight) {
        return Column(
          children: <Widget>[
            Text(toInt(height).toString()),
            Container(
              height: (1 - animatedHeight) * _maxElementHeight,
            ),
            Container(
              width: 20,
              height: animatedHeight * _maxElementHeight,
              color: Color.fromRGBO(40, 83, 107, 1),
            ),
            RotatedBox(
              quarterTurns: 1,
              child: Text("   " + label),
            ),
          ],
        );
      },
    );
  }
}



class SleepBar extends StatelessWidget {
  final List<double> numbers = [
    8,
    5,
    6,
    9,
    7,
    7,
    6,
  ];

  final List<String> axes = [
    "Apr. 18",
    "Apr. 19",
    "Apr. 20",
    "Apr. 21",
    "Apr. 22",
    "Apr. 23",
    "Apr. 24"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            "Hours Slept This Week",
            style: TextStyle(fontSize: 25),
          ),
          Text("\n"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Bar(numbers[0], axes[0]),
              Bar(numbers[1], axes[1]),
              Bar(numbers[2], axes[2]),
              Bar(numbers[3], axes[3]),
              Bar(numbers[4], axes[4]),
              Bar(numbers[5], axes[5]),
              Bar(numbers[6], axes[6]),
            ],
          ),
        ],
      )
    );
  }
}