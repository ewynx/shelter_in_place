import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelter_in_place/models/day_model.dart';
import 'package:path_provider/path_provider.dart';

class BackendService {

  final databaseFilename = 'distince-day-entries.json';

  Future<String> getDatabasePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return(directory.path);
  }

  Future<File> getDatabaseFile() async {
    final path = await getDatabasePath();
    return File('$path/' + this.databaseFilename);
  }

  Future<String> getDatabaseFileContents() async {
    final file = await getDatabaseFile();
    return(await file.readAsString());
  }

  Future<bool> databaseFileExists() async {
    final path = await getDatabasePath();
    return (File('$path/' + this.databaseFilename).exists());
  }

  Future<List<Day>> getDays() async {
    List<Day> days = [];
    final daysString = await getDatabaseFileContents();
    Map<String, dynamic> daysMap = jsonDecode(daysString);
    daysMap.forEach((mapKey, value) {
      Day newDay = new Day.fromMap(daysMap[mapKey], mapKey);
      days.add(newDay);
    });
    return days;
  }

  Future<File> addDay(Day day) async {
    print("Adding the following day to the database file: " + day.toJson().toString());
    Map<String, dynamic> daysMap = Map();
    final file = await getDatabaseFile();
    bool fileExists = await databaseFileExists();
    if (fileExists) {
      // Read the current contents, convert to JSON
      String contents = await file.readAsString();
      daysMap = jsonDecode(contents);
    }
    // Add the current dayJson to the original JSON
    daysMap[day.id] = day.toJson();

    // Convert the full json to a string, and write that string to the database file
    String daysString = jsonEncode(daysMap);
    return file.writeAsString('$daysString');
  }

  Future<bool> hasAnsweredToday() async {
    bool fileExists = await databaseFileExists();
    bool hasAnsweredToday = false;
    if (fileExists) {
      DateTime today = DateTime.now();
      String todayFormattedAsId = today.month.toString() + today.day.toString() + today.year.toString() + today.millisecond.toString();
      final daysString = await getDatabaseFileContents();
      Map<String, dynamic> daysMap = jsonDecode(daysString);
      daysMap.forEach((mapKey, value) {
        Day day = new Day.fromMap(daysMap[mapKey], mapKey);
        if (day.id == todayFormattedAsId) {
          hasAnsweredToday = true;
        }
      });
      return hasAnsweredToday;
    }
    else {
      return hasAnsweredToday;
    }
  }
}