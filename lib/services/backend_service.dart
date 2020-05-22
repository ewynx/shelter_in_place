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

  Future<bool> databaseFileExists() async {
    final path = await getDatabasePath();
    return (File('$path/' + this.databaseFilename).exists());
  }

  List<String> getDays() {
    List<String> days = [];
    return days;
  }

  Future<void> addDay(Day day) async {
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
    file.writeAsString('$daysString');

    // Print the contents of the file after
    // String updatedContents = await file.readAsString();
    // print('The updated contents are: $updatedContents');
  }

  Future<int> getStreak() async {
    try {
      final file = await getDatabaseFile();
      String contents = await file.readAsString();
      int streak = int.parse(contents);
      print('The streak is: $streak');
      return streak;
    } catch (e) {
      return 0;
    }
  }

  Future<File> updateStreak(int newStreak) async {
    print('Setting the new streak to: $newStreak');
    final file = await getDatabaseFile();
    return file.writeAsString('$newStreak');
  }
}