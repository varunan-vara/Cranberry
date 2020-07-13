import 'package:flutter/material.dart';

var showSleep = true;
var showDiary = true;

void changeSleep(val) {
  showSleep = val;
  print("showSleep = " + showSleep.toString());
}

void changeDiary(val) {
  showDiary = val;
  print("showDiary = " + showDiary.toString());
}