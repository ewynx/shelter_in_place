import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class Constants {
  static final List<String> feelings = [
    "Happy",
    "Angry",
    "Depressed",
    "Joyful",
    "Surprised",
    "Excited",
    "Sad",
    "Silly",
    "Anxious",
    "Scared",
    "Calm",
    "Distracted"
  ];

  HashMap<String, Color> colorsFeelings() {
    HashMap colorsFeelings = new HashMap<String, Color>();
    colorsFeelings.putIfAbsent(feelings[0], () => purple);
    colorsFeelings.putIfAbsent(feelings[1], () => cyan);
    colorsFeelings.putIfAbsent(feelings[2], () => indigo);
    colorsFeelings.putIfAbsent(feelings[3], () => pink);
    colorsFeelings.putIfAbsent(feelings[4], () => yellow);
    colorsFeelings.putIfAbsent(feelings[5], () => orange);
    colorsFeelings.putIfAbsent(feelings[6], () => teal);
    colorsFeelings.putIfAbsent(feelings[7], () => blue);
    colorsFeelings.putIfAbsent(feelings[8], () => red);
    colorsFeelings.putIfAbsent(feelings[9], () => yellow2);
    colorsFeelings.putIfAbsent(feelings[10], () => green);
    colorsFeelings.putIfAbsent(feelings[11], () => brown);
    return colorsFeelings;
  }

  static final List<String> activitities = [
    "tv",
    "read",
    "cook",
    "exercise",
    "call",
    "videogames",
    "nap",
    "clean",
    "walk",
    "groceries",
    "other"
  ];

  HashMap<String, String> shortActivities() {
    HashMap shortActivities = new HashMap<String, String>();
    activitities.forEach((act) {
      shortActivities.putIfAbsent(act, () => act + '-short');
    });

    return shortActivities;
  }

  void addEntries(String keyname, Color color, HashMap<String, Color> map) {
    map.putIfAbsent(keyname, () => color);
    map.putIfAbsent(shortActivities()[keyname], () => color);
  }

  HashMap<String, Color> colorsActivitities() {
    HashMap colorsActivitities = new HashMap<String, Color>();
    addEntries(activitities[0], purple, colorsActivitities);
    addEntries(activitities[1], cyan, colorsActivitities);
    addEntries(activitities[2], indigo, colorsActivitities);
    addEntries(activitities[3], pink, colorsActivitities);
    addEntries(activitities[4], yellow, colorsActivitities);
    addEntries(activitities[5], orange, colorsActivitities);
    addEntries(activitities[6], teal, colorsActivitities);
    addEntries(activitities[7], blue, colorsActivitities);
    addEntries(activitities[8], red, colorsActivitities);
    addEntries(activitities[9], yellow2, colorsActivitities);
    addEntries(activitities[10], green, colorsActivitities);
    return colorsActivitities;
  }
}
