import 'dart:collection';

class Day {
  String id;
  DateTime date;
  bool socialDistance;
  Set<String> feelings;
  Set<String> activities;
  String note;

  Day(
      {this.id,
      this.date,
      this.socialDistance,
      this.feelings,
      this.activities,
      this.note});

  Day.fromMap(Map snapshot, String id)
      : id = snapshot['id'] ?? '',
        date = DateTime.parse(snapshot['date']) ?? '',
        //TODO check how to put it in the correct timezone
        socialDistance = snapshot['socialDistance'] ?? '',
        feelings = Set<String>.from(snapshot['feelings']) ?? new HashSet(),
        activities = Set<String>.from(snapshot['activities']) ?? new HashSet(),
        note = snapshot['note'] ?? '';

  List<String> getActivities() {
    return this.activities.toList();
  }

  List<String> getFeelings() {
    return this.feelings.toList();
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'date': this.date.toString(),
        'socialDistance': this.socialDistance,
        'feelings': this.feelings.toList(),
        'activities': this.activities.toList(),
        'note': this.note
      };

  String getDayName() {
    switch (date.weekday) {
      case 1: return 'Monday'; break;
      case 2: return 'Tuesday'; break;
      case 3: return 'Wednesday'; break;
      case 4: return 'Thursday'; break;
      case 5: return 'Friday'; break;
      case 6: return 'Saturday'; break;
      case 7: return 'Sunday'; break;
    }
  }
}
