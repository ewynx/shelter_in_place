import 'package:shelter_in_place/models/day_model.dart';

class BackendService {

  List<String> getDays() {
    List<String> days = [];
    return days;
  }

  void addDay(Day day) {
    print("Adding the following day to the backend: " + day.toString());
  }

  int getStreak() {
    int consecutiveDays = 1;
    return consecutiveDays;
  }

  void updateStreak() {
    print("Setting the new streak to zero");
  }

}