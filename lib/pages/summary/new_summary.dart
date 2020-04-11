import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/question_bottom_bar.dart';
import 'package:shelter_in_place/pages/questions/my_continue_button.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/summary/single_day_summary.dart';

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
    List<String> acts = Constants.activitities;

    void shuffle() {
      feels.shuffle(Random.secure());
      acts.shuffle(Random.secure());
    }

    Day day1 = Day(
        id: "first",
        date: DateTime.now(),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(5).toList(),
        note:
            'Today was a pretty good day! I read a book and went for a run by myself.');

    shuffle();
    Day day2 = Day(
        id: "second",
        date: new DateTime(2020, 3, 28),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(4).toList(),
        note: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ');

    shuffle();
    Day day3 = Day(
        id: "third",
        date: new DateTime(2020, 3, 27),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(3).toList(),
        note: 'This is the second day');

    shuffle();
    Day day4 = Day(
        id: "fourth",
        date: new DateTime(2020, 3, 26),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(2).toList(),
        note: 'This is the second day');

    Day day5 = Day(
        id: "fifth",
        date: new DateTime(2020, 3, 25),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(4).toList(),
        note: 'This is the second day');

    shuffle();
    Day day6 = Day(
        id: "sixth",
        date: new DateTime(2020, 3, 24),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(2).toList(),
        note: 'This is the second day');

    shuffle();
    Day day7 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 23),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(2).toList(),
        note: 'This is the second day');

    shuffle();
    Day day8 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 22),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(2).toList(),
        note: 'This is the second day');
    Day day9 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 21),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(2).toList(),
        note: 'This is the second day');
    Day day10 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 20),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(2).toList(),
        note: 'This is the second day');
    Day day11 = Day(
        id: "seventh",
        date: new DateTime(2020, 3, 19),
        socialDistance: true,
        feelings: feels.take(6).toList(),
        activities: acts.take(2).toList(),
        note: 'This is the second day');

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
            child: ListView(
              children: <Widget>[
                SingleDaySummary(day: day1),
                SingleDaySummary(day: day2),
                SingleDaySummary(day: day3),
                SingleDaySummary(day: day4),
                SingleDaySummary(day: day5),
                SingleDaySummary(day: day6),
                SingleDaySummary(day: day8),
                SingleDaySummary(day: day9),
                SingleDaySummary(day: day10),
                SingleDaySummary(day: day11),
              ],
            ),
          )
        ]));
  }
}
