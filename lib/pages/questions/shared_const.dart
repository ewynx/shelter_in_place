import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class Constants {
  final List<String> feelings = [
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

  final List<String> activitities = [
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

  HashMap<String, Color> colorsActivitities() {
    HashMap colorsActivitities = new HashMap<String, Color>();
    colorsActivitities.putIfAbsent(activitities[0], () => purple);
    colorsActivitities.putIfAbsent(activitities[1], () => cyan);
    colorsActivitities.putIfAbsent(activitities[2], () => indigo);
    colorsActivitities.putIfAbsent(activitities[3], () => pink);
    colorsActivitities.putIfAbsent(activitities[4], () => yellow);
    colorsActivitities.putIfAbsent(activitities[5], () => orange);
    colorsActivitities.putIfAbsent(activitities[6], () => teal);
    colorsActivitities.putIfAbsent(activitities[7], () => blue);
    colorsActivitities.putIfAbsent(activitities[8], () => red);
    colorsActivitities.putIfAbsent(activitities[9], () => yellow2);
    colorsActivitities.putIfAbsent(activitities[10], () => green);
    return colorsActivitities;
  }
}
