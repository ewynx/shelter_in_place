import 'package:charts_flutter/flutter.dart';

/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final Day day;

  StackedHorizontalBarChart(this.seriesList, this.day, {this.animate});

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
    child:new ConstrainedBox(
        constraints: new BoxConstraints(
          maxHeight: 30.0,
        ),
        child: new charts.BarChart(seriesList,
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
            behaviors: [
              new charts.ChartTitle(AppLocalizations.of(context).translate(day.getDayName()),
                  behaviorPosition: charts.BehaviorPosition.top,
                  titleStyleSpec: TextStyleSpec(fontSize: 11),
                  titleOutsideJustification:
                      charts.OutsideJustification.startDrawArea)
            ])));
  }
}

class OrdinalFeeling {
  final String feeling;
  final DateTime date;
  final int value = 1;

  OrdinalFeeling(this.feeling, this.date);
}
