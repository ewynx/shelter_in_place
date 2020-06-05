import 'dart:collection';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/util/my_graph.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

import 'util/colors.dart';

class SingleOverviewChart extends StatelessWidget {
  SingleOverviewChart();

  /// Create series list with multiple series
  static List<charts.Series<OrdinalFeeling, String>>
      _createSampleDataFeelings() {
    final DateTime today = DateTime.now();
    final happyData = [
      new OrdinalFeeling('Happy', today),
    ];

    final angryData = [
      new OrdinalFeeling('Angry', today),
    ];

    final sadData = [
      new OrdinalFeeling('Sad/Depressed', today),
    ];

    return [
      new charts.Series<OrdinalFeeling, String>(
        id: 'Angry',
        domainFn: (OrdinalFeeling feeling, _) => feeling.date.toIso8601String(),
        measureFn: (OrdinalFeeling feeling, _) => feeling.value,
        data: angryData,
        colorFn: (_, __) => getChartColor(indigo1),
      ),
      new charts.Series<OrdinalFeeling, String>(
        id: 'Sad/Depressed',
        domainFn: (OrdinalFeeling feeling, _) => feeling.date.toIso8601String(),
        measureFn: (OrdinalFeeling feeling, _) => feeling.value,
        data: sadData,
        colorFn: (_, __) => getChartColor(purple2),
      ),
      new charts.Series<OrdinalFeeling, String>(
        id: 'Happy',
        domainFn: (OrdinalFeeling feeling, _) => feeling.date.toIso8601String(),
        measureFn: (OrdinalFeeling feeling, _) => feeling.value,
        data: happyData,
        colorFn: (_, __) => getChartColor(yellow1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 30.0),
          child: StackedHorizontalBarChart(
            _createSampleDataFeelings(),
            animate: true,
          ),
        ),
      ],
    ));
  }
}

charts.Color getChartColor(Color color) {
  return charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
