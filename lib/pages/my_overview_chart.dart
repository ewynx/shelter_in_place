import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/util/my_graph.dart';

class SingleOverviewChart extends StatelessWidget {
  SingleOverviewChart({@required this.days});

  final List<Day> days;

  @override
  Widget build(BuildContext context) {
    return StackedHorizontalBarChart(getDataFromDays(days),
              animate: true);
  }
}

charts.Color getChartColor(Color color) {
  return charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

// Per feeling we make a separate Series with its own color
charts.Series<OrdinalFeeling, String> getSeries(
    List<OrdinalFeeling> res, String feeling) {
  var series = new charts.Series<OrdinalFeeling, String>(
    id: feeling,
    domainFn: (OrdinalFeeling data, _) => data.date.toIso8601String(),
    measureFn: (OrdinalFeeling data, _) => data.value,
    data: res.where((element) => element.feeling == feeling).toList(),
    colorFn: (_, __) => getChartColor(Constants().colorsFeelings()[feeling]),
  );
  return series;
}

// The days are transformed into a list of data containing feelings per day
List<charts.Series<OrdinalFeeling, String>> getDataFromDays(List<Day> days) {
  List<OrdinalFeeling> data = [];
  for (var day in days) {
    data.addAll(
        day.feelings.map((feeling) => new OrdinalFeeling(feeling, day.date)));
  }

  List<charts.Series<OrdinalFeeling, String>> series = [];

  for (var feeling in Constants.feelings) {
    series.add(getSeries(data, feeling));
  }
  return series;
}
