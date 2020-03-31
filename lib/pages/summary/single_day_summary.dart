import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/util/colors.dart';
import 'package:shelter_in_place/pages/util/my_legend_item.dart';

class SingleDaySummary extends StatelessWidget {
  SingleDaySummary({@required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    List<LegendElement> activities = day.activities.map((String keyName) {
      return LegendElement(
        keyName: keyName,
        fontsize: 8.0,
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
        child: ExpansionTile(
      title: Text(
        dayName + ', ' + monthName + ' ' + dayNr,
        style: new TextStyle(),
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        Divider(),
        Text(
          AppLocalizations.of(context).translate('My activities'),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        ConstrainedBox(
            constraints: BoxConstraints.expand(height: 90.0),
            child: getGrid(activities)),
        Text(
          AppLocalizations.of(context).translate('My mood'),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        ConstrainedBox(
            constraints: BoxConstraints.expand(height: 90.0),
            child: getGrid(mood)),
        Text(
          AppLocalizations.of(context).translate('My notes'),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: backgroundGrey,
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(5.0)),
              child: Padding(
                  padding: const EdgeInsets.all(14.0), child: Text(day.note)),
            )),
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
