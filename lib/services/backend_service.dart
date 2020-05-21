import 'dart:async';
import 'dart:io';

import 'package:shelter_in_place/models/day_model.dart';
import 'package:path_provider/path_provider.dart';

class BackendService {

  Future<String> getDatabasePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return(directory.path);
  }

  Future<File> getDatabaseFile() async {
    final path = await getDatabasePath();
    return File('$path/database.txt');
  }

  List<String> getDays() {
    List<String> days = [];
    return days;
  }

  void addDay(Day day) {
    print("Adding the following day to the backend: " + day.toString());
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