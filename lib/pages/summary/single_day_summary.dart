import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/summary/mood_const.dart';
import 'package:shelter_in_place/pages/util/colors.dart';
import 'package:shelter_in_place/pages/util/my_legend_item.dart';

class SingleDaySummary extends StatelessWidget {
  SingleDaySummary({@required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    List<LegendElement> activities = day.activities.map((String keyName) {
      return LegendElement(
        keyName: Constants().shortActivities()[keyName],
        // Display a shorter activity name
        fontsize: 9.0,
        colors: Constants().colorsActivitities(),
      );
    }).toList();

    List<LegendElement> mood = day.feelings.map((String keyName) {
      return LegendElement(
          keyName: keyName,
          fontsize: 9.0,
          colors: Constants().colorsFeelings());
    }).toList();

    String dayName = DateFormat('EEEE').format(day.date);
    String monthName = DateFormat('MMMM').format(day.date);
    String dayNr = DateFormat('d').format(day.date);

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: ExpansionTile(
          title: Text(
            dayName + ', ' + monthName + ' ' + dayNr,
            style: new TextStyle(color: darkSlateBlue),
            textAlign: TextAlign.center,
          ),
          trailing: Icon(Icons.add, size: 36.0, color: darkSlateBlue),
          leading: getMoodIcon(day),
          children: <Widget>[
            Divider(),
            subTitle(context, 'My activities'),
            ConstrainedBox(
                constraints: BoxConstraints.expand(height: 80.0),
                child: getGrid(activities)),
            subTitle(context, 'My mood'),
            ConstrainedBox(
                constraints: BoxConstraints.expand(height: 70.0),
                child: getGrid(mood)),
            subTitle(context, 'My notes'),
            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: backgroundGrey,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.circular(5.0)),
                        child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(day.note)),
                      )))
            ]),
          ],
        ));
  }
}

GridView getGrid(List<LegendElement> items) {
  return GridView.count(
      // Create a grid with 2 columns
      crossAxisCount: 2,
      childAspectRatio: 10,
      padding: const EdgeInsets.all(1.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      // Generate 100 widgets that display their index in the List.
      children: items);
}

Icon getMoodIcon(Day day) {
  int points = day.feelings.map((feeling) {
    return MoodConstants().pointPerFeeling()[feeling];
  }).reduce((a, b) => a + b);

  IconData data;
  Color color;
  if (points == 0) {
    data = Icons.sentiment_neutral;
    color = darkSlateBlue;
  } else if (points < 0 && points > -4) {
    data = Icons.sentiment_dissatisfied;
    color = outerCircleOrange;
  } else if (points < 0) {
    data = Icons.sentiment_very_dissatisfied;
    color = circleOrange;
  } else if (points > 0 && points < 4) {
    data = Icons.sentiment_satisfied;
    color = powderBlue;
  } else {
    data = Icons.sentiment_very_satisfied;
    color = red;
  }

  return Icon(data, size: 36.0, color: color);
}

Widget subTitle(BuildContext context, String keyname) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            AppLocalizations.of(context).translate(keyname),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          )));
}
