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

  static final List<String> activities = [
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
    activities.forEach((act) {
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
    addEntries(activities[0], purple, colorsActivitities);
    addEntries(activities[1], cyan, colorsActivitities);
    addEntries(activities[2], indigo, colorsActivitities);
    addEntries(activities[3], pink, colorsActivitities);
    addEntries(activities[4], yellow, colorsActivitities);
    addEntries(activities[5], orange, colorsActivitities);
    addEntries(activities[6], teal, colorsActivitities);
    addEntries(activities[7], blue, colorsActivitities);
    addEntries(activities[8], red, colorsActivitities);
    addEntries(activities[9], yellow2, colorsActivitities);
    addEntries(activities[10], green, colorsActivitities);
    return colorsActivitities;
  }
}
