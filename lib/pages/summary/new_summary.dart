import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
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
    final backendService = new BackendService();
    // Get days for correct month
    final daysFuture = backendService.getDays();

    List months = ['jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec'];
    var now = new DateTime.now();
    String title = AppLocalizations.of(context).translate('My log for')
    + AppLocalizations.of(context).translate(months[now.month-1]);

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
