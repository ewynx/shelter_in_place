import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/util/round_checkbox.dart';

class Feelings extends StatefulWidget {
  @override
  _FeelingsState createState() => _FeelingsState();
}

class _FeelingsState extends State<Feelings> {
  HashMap answers = new HashMap<String, bool>();

  @override
  Widget build(BuildContext context) {
    List<String> feelings = Constants.feelings;
    feelings.forEach((feeling) => answers.putIfAbsent(feeling, () => false));

    GridView tiles = GridView.count(
        // Create a grid with 2 columns
        crossAxisCount: 2,
        childAspectRatio: 3,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        // Generate 100 widgets that display their index in the List.
        children: feelings.map((String keyName) {
          return GridTile(
              child: LabeledCheckbox(
            label: AppLocalizations.of(context).translate(keyName),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: answers[keyName],
            onChanged: (bool newValue) {
              setState(() {
                answers.update(keyName, (e) => newValue);
              });
            },
          ));
        }).toList());

    return Center(
      child: Padding(
          padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
          child: Column(children: <Widget>[
            Text(AppLocalizations.of(context).translate('question feelings'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(height: 20.0),
            Text(AppLocalizations.of(context).translate('check all'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                )),
            SizedBox(height: 40.0),
            new Flexible(fit: FlexFit.tight, child: tiles)
          ])),
    );
  }
}
