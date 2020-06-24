import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/util/my_graph.dart';

class LastMoodsChart extends StatelessWidget {
  LastMoodsChart({@required this.days});

  final List<Day> days;

  @override
  Widget build(BuildContext context) {
    List<List<charts.Series<OrdinalFeeling, String>>> dataAllDays =
        days.reversed.map((day) => getDataForDay(day)).toList();
    return ListView.builder(
        itemCount: dataAllDays.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return StackedHorizontalBarChart(
              dataAllDays[index],
              days.reversed.toList()[index],
              animate: true);
        });
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

// The day is transformed into a list of data containing the feelings for this day
List<charts.Series<OrdinalFeeling, String>> getDataForDay(Day day) {
  List<OrdinalFeeling> data = day.feelings
      .map((feeling) => new OrdinalFeeling(feeling, day.date))
      .toList();
  List<charts.Series<OrdinalFeeling, String>> series = [];
  for (var feeling in Constants.feelings) {
    series.add(getSeries(data, feeling));
  }
  return series;
}
