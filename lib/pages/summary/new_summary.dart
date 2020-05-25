import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/question_bottom_bar.dart';
import 'package:shelter_in_place/pages/questions/my_continue_button.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/summary/single_day_summary.dart';
import 'package:shelter_in_place/services/backend_service.dart';

final List<dynamic> dates = <dynamic>[
  'Sunday, March 22',
  'Saturday, March 21',
  'Friday, March 20',
  'Thursday, March 19',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
];

class NewSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> feels = Constants.feelings;
    List<String> acts = Constants.activities;
    final backendService = new BackendService();
    Day day1 = Provider.of<Day>(context);

    void shuffle() {
      feels.shuffle(Random.secure());
      acts.shuffle(Random.secure());
    }

    // Day day1 = Day(
    //     id: "first",
    //     date: DateTime.now(),
    //     socialDistance: true,
    //     feelings: feels.take(6).toList().toSet(),
    //     activities: acts.take(5).toList().toSet(),
    //     note:
    //         'Today was a pretty good day! I read a book and went for a run by myself.');

    shuffle();
    Day day2 = Day(
        id: "second",
        date: new DateTime(2020, 3, 28),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(4).toList().toSet(),
        note: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ');

    shuffle();
    Day day3 = Day(
        id: "third",
        date: new DateTime(2020, 3, 27),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(3).toList().toSet(),
        note: 'This is the second day');

    shuffle();
    Day day4 = Day(
        id: "fourth",
        date: new DateTime(2020, 3, 26),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(2).toList().toSet(),
        note: 'This is the second day');

    Day day5 = Day(
        id: "fifth",
        date: new DateTime(2020, 3, 25),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(4).toList().toSet(),
        note: 'This is the second day');

    shuffle();
    Day day6 = Day(
        id: "sixth",
        date: new DateTime(2020, 3, 24),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(2).toList().toSet(),
        note: 'This is the second day');

    shuffle();
    Day day7 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 23),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(2).toList().toSet(),
        note: 'This is the second day');

    shuffle();
    Day day8 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 22),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(2).toList().toSet(),
        note: 'This is the second day');
    Day day9 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 21),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(2).toList().toSet(),
        note: 'This is the second day');
    Day day10 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 20),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(2).toList().toSet(),
        note: 'This is the second day');
    Day day11 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 19),
        socialDistance: true,
        feelings: feels.take(6).toList().toSet(),
        activities: acts.take(2).toList().toSet(),
        note: 'This is the second day');

    // List<Day> days = [day1, day2, day3, day4, day5, day6, day7, day8, day9, day10, day11];

    final daysFuture = backendService.getDays();

    String title = AppLocalizations.of(context).translate('streak text') +
        ' 22 ' +
        AppLocalizations.of(context).translate('days') +
        '.';

    return Container(
        padding: EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 10),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))),
          Expanded(
            child: FutureBuilder<List<Day>>(
              future: daysFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return ErrorWidget(snapshot.toString());
                  }
                  List<Day> days = snapshot.data ?? [];
                  // Add the current day to the days list in case it hasn't been
                  //  written to the database file yet
                  if (days[days.length - 1].id != day1.id) {
                    days.add(day1);
                  }
                  return ListView.builder(
                    itemCount: days.length,
                    itemBuilder: (BuildContext buildContext, int index) {
                      return SingleDaySummary(day: days[days.length - index - 1]);
                    }
                  );
                }
                else {
                  return JumpingDotsProgressIndicator(fontSize: 100.0, color: Colors.blue);
                }
              }
            ),
          )
        ]));
  }
}
