import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shelter_in_place/pages/util/my_legend.dart';
import '../auth.dart';

import 'my_overview_chart.dart';

class MyOverviewChart extends StatefulWidget {
  @override
  _MyOverviewChartState createState() => _MyOverviewChartState();
}

class _MyOverviewChartState extends State<MyOverviewChart> {
  @override
  Widget build(BuildContext context) {
    List<String> shuffledFeelings = Constants.feelings;
    shuffledFeelings.shuffle(Random.secure());

    List<String> shuffledActivities = Constants.activities;
    shuffledActivities.shuffle(Random.secure());

    List<SingleOverviewChart> charts =
        new List<SingleOverviewChart>.generate(7, (i) => SingleOverviewChart());

    return Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 50, 40, 20),
                child: Text(
                    AppLocalizations.of(context)
                        .translate('Your last 7 entries'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))),
            Card(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    SimpleLegenda(
                        items: Constants.feelings,
                        height: 110.0,
                        colors: Constants().colorsFeelings()),
                    for (var item in charts) item,
                    SizedBox(height: 20.0),

                  ],
                ))
          ],
        ));
  }
}
