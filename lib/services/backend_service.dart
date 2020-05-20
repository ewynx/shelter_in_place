import 'package:hive/hive.dart';
import 'package:shelter_in_place/models/day_model.dart';

class BackendService {

  List<String> getDays() {
    List<String> days = [];
    return days;
  }

  void addDay(Day day) async {
    print("Adding the following day to the backend: " + day.toString());
    String date =  day.date.month.toString() + day.date.day.toString() + day.date.year.toString();
    String date2 = day.date.month.toString() + 18.toString() + day.date.year.toString();
    print("The day's date is: " + date);
    var dayBox = await Hive.openBox('testBox');
    dayBox.put(date, 'Today');
    dayBox.put(date2, 'Yesterday');
    List<dynamic> days = dayBox.get('days', defaultValue: []);
    days.add(date);
    days.add(date2);
    print('The previous Days are: ' + days.toString());
    print('The first day is: ' + dayBox.get(date));
    dayBox.put('days', days);
    print('All the days are: ' + days.toString());
  }

  int getStreak() {
    int consecutiveDays = 1;
    return consecutiveDays;
  }

  void updateStreak() {
    print("Setting the new streak to zero");
  }

}