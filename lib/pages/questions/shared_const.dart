import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class Constants {
  static final List<String> feelings = [
    "Happy",
    "Angry",
    "Content",
    "Anxious",
    "Relaxed",
    "Sad/Depressed",
    "Energetic",
    "Tired",
    "Inspired",
    "Scared"
  ];

  HashMap<String, Color> colorsFeelings() {
    HashMap colorsFeelings = new HashMap<String, Color>();
    colorsFeelings.putIfAbsent("Relaxed", () => yellow5);
    colorsFeelings.putIfAbsent("Happy", () => yellow1);
    colorsFeelings.putIfAbsent("Inspired", () => yellow2);
    colorsFeelings.putIfAbsent("Content", () => yellow3);
    colorsFeelings.putIfAbsent("Energetic", () => yellow4);

    colorsFeelings.putIfAbsent("Anxious", () => purple);
    colorsFeelings.putIfAbsent("Sad/Depressed", () => indigo2);
    colorsFeelings.putIfAbsent("Angry", () => indigo1);
    colorsFeelings.putIfAbsent("Scared", () => indigo3);
    colorsFeelings.putIfAbsent("Tired", () => purple2);

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
    "meditate",
    "other"
  ];

  HashMap<String, String> shortActivities() {
    HashMap shortActivities = new HashMap<String, String>();
    activities.forEach((act) {
      shortActivities.putIfAbsent(act, () => act + '-short');
    });

    return shortActivities;
  }

  void addColorEntry(String keyname, Color color, HashMap<String, Color> map) {
    map.putIfAbsent(keyname, () => color);
    map.putIfAbsent(shortActivities()[keyname], () => color);
  }

  HashMap<String, Color> colorsActivitities() {
    HashMap colorsActivitities = new HashMap<String, Color>();
    addColorEntry(activities[0], purple, colorsActivitities);
    addColorEntry(activities[1], cyan, colorsActivitities);
    addColorEntry(activities[2], indigo1, colorsActivitities);
    addColorEntry(activities[3], pink, colorsActivitities);
    addColorEntry(activities[4], yellow1, colorsActivitities);
    addColorEntry(activities[5], orange, colorsActivitities);
    addColorEntry(activities[6], teal, colorsActivitities);
    addColorEntry(activities[7], blue, colorsActivitities);
    addColorEntry(activities[8], red, colorsActivitities);
    addColorEntry(activities[9], yellow2, colorsActivitities);
    addColorEntry(activities[10], green, colorsActivitities);
    addColorEntry(activities[11], lightRed, colorsActivitities);
    return colorsActivitities;
  }

  void addIconEntry(
      String keyname, IconData icon, HashMap<String, IconData> map) {
    map.putIfAbsent(keyname, () => icon);
    map.putIfAbsent(shortActivities()[keyname], () => icon);
  }

  HashMap<String, IconData> iconActivitities() {
    HashMap iconsForActivities = new HashMap<String, IconData>();
    addIconEntry("walk", Icons.directions_walk, iconsForActivities);
    addIconEntry("tv", Icons.tv, iconsForActivities);
    addIconEntry("read", Icons.library_books, iconsForActivities);
    addIconEntry("cook", Icons.restaurant, iconsForActivities);
    addIconEntry("exercise", Icons.accessibility_new, iconsForActivities);
    addIconEntry("call", Icons.call, iconsForActivities);
    addIconEntry("videogames", Icons.videogame_asset, iconsForActivities);
    addIconEntry("nap", Icons.local_hospital, iconsForActivities);
    addIconEntry("clean", Icons.local_laundry_service, iconsForActivities);
    addIconEntry("groceries", Icons.local_grocery_store, iconsForActivities);
    addIconEntry("meditate", Icons.spa, iconsForActivities);
    addIconEntry("other", Icons.grade, iconsForActivities);
    return iconsForActivities;
  }
}
