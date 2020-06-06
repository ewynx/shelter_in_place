/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedHorizontalBarChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new ConstrainedBox(
        constraints: new BoxConstraints(
          maxHeight: 30.0,
        ),
        child: new charts.BarChart(
          seriesList,
          animate: animate,
          barGroupingType: charts.BarGroupingType.stacked,
          vertical: false,
          primaryMeasureAxis: new charts.NumericAxisSpec(
              renderSpec: new charts.NoneRenderSpec()),
          domainAxis: new charts.OrdinalAxisSpec(
              // Make sure that we draw the domain axis line.
              showAxisLine: true,
              // But don't draw anything else.
              renderSpec: new charts.NoneRenderSpec()),
        ));
  }
}

class OrdinalFeeling {
  final String feeling;
  final DateTime date;
  final int value = 1;

  OrdinalFeeling(this.feeling, this.date);
}
