import 'dart:math';

import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shelter_in_place/pages/util/my_legend.dart';
import 'package:shelter_in_place/services/backend_service.dart';
import '../../auth.dart';

import 'my_overview_chart.dart';

class MyOverviewChart extends StatefulWidget {
  @override
  _MyOverviewChartState createState() => _MyOverviewChartState();
}

class _MyOverviewChartState extends State<MyOverviewChart> {
  @override
  Widget build(BuildContext context) {
    final backendService = new BackendService();
    // Get days for correct month
    final daysFuture = backendService.getDays();

    return Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 50, 40, 10),
                child:
                    Text(AppLocalizations.of(context).translate('Mood tracker'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))),
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                child: Text(
                    AppLocalizations.of(context)
                        .translate('Your last 7 entries'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))),
            SimpleLegenda(
                items: Constants.feelings,
                height: 120.0,
                colors: Constants().colorsFeelings()),
            SizedBox(height: 20.0),
            Expanded(
                child: FutureBuilder<List<Day>>(
                    future: daysFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return ErrorWidget(snapshot.toString());
                        }
                        // Take the last 7 entries if possible
                        List<Day> days = snapshot.data.take(7).toList() ?? [];
                        return OverviewChart(days: days);
                      } else {
                        return JumpingDotsProgressIndicator(
                            fontSize: 100.0, color: Colors.blue);
                      }
                    }))
          ],
        ));
  }
}
