import 'dart:collection';

class Day {
  String id;
  DateTime date;
  bool socialDistance;
  Set<String> feelings;
  Set<String> activities;
  String note;

  Day({this.id, this.date, this.socialDistance, this.feelings, this.activities, this.note});

  Day.fromMap(Map snapshot,String id) :
        id = id ?? '',
        date = snapshot['date'] ?? '', //TODO check how to put it in the correct timezone
        socialDistance = snapshot['socialDistance'] ?? '',
        feelings = snapshot['feelings'] ?? new HashSet(),
        activities = snapshot['activities'] ?? new HashSet(),
        note = snapshot['note'] ?? '';

  List<String> getActivities() {
    return this.activities.toList();
  }

  List<String> getFeelings() {
    return this.feelings.toList();
  }

  Map<String, dynamic> toJson() =>
    {
      'id': this.id,
      'date': this.date.toString(),
      'socialDistance': this.socialDistance,
      'feelings': this.feelings.toList(),
      'activities': this.activities.toList(),
      'note': this.note
    };
}