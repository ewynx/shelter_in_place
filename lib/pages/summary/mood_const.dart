import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';

class MoodConstants {
  List<String> feelings = Constants.feelings;

  HashMap<String, int> pointPerFeeling() {
    HashMap pointPerFeeling = new HashMap<String, int>();
    pointPerFeeling.putIfAbsent(feelings[0], () => 2);
    pointPerFeeling.putIfAbsent(feelings[1], () => -2);
    pointPerFeeling.putIfAbsent(feelings[2], () => -2);
    pointPerFeeling.putIfAbsent(feelings[3], () => 2);
    pointPerFeeling.putIfAbsent(feelings[4], () => 1);
    pointPerFeeling.putIfAbsent(feelings[5], () => 2);
    pointPerFeeling.putIfAbsent(feelings[6], () => -1);
    pointPerFeeling.putIfAbsent(feelings[7], () => 1);
    pointPerFeeling.putIfAbsent(feelings[8], () => -2);
    pointPerFeeling.putIfAbsent(feelings[9], () => -2);
    pointPerFeeling.putIfAbsent(feelings[10], () => 1);
    pointPerFeeling.putIfAbsent(feelings[11], () => 0);
    return pointPerFeeling;
  }
}
