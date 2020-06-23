import 'dart:collection';

import 'package:shelter_in_place/pages/questions/shared_const.dart';

class MoodConstants {
  List<String> feelings = Constants.feelings;

  HashMap<String, int> pointPerFeeling() {
    HashMap pointPerFeeling = new HashMap<String, int>();
    pointPerFeeling.putIfAbsent("Relaxed", () => 1);
    pointPerFeeling.putIfAbsent("Happy", () => 2);
    pointPerFeeling.putIfAbsent("Inspired", () => 2);
    pointPerFeeling.putIfAbsent("Content", () => 1);
    pointPerFeeling.putIfAbsent("Energetic", () => 2);

    pointPerFeeling.putIfAbsent("Anxious", () => -2);
    pointPerFeeling.putIfAbsent("Sad/Depressed", () => -2);
    pointPerFeeling.putIfAbsent("Angry", () => -2);
    pointPerFeeling.putIfAbsent("Scared", () => -2);
    pointPerFeeling.putIfAbsent("Tired", () => -2);
    return pointPerFeeling;
  }
}
