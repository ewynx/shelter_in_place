import 'dart:collection';

import 'package:flutter/material.dart';

import 'my_legend_item.dart';

class SimpleLegenda extends StatelessWidget {
  SimpleLegenda(
      {@required this.items, @required this.height, @required this.colors});

  final List<String> items;
  final double height;
  final HashMap<String, Color> colors;

  @override
  Widget build(BuildContext context) {
    List<LegendElement> legendElements = items.map((String keyName) {
      return LegendElement(keyName: keyName, fontsize: 9.0, colors: colors);
    }).toList();

    GridView grid = GridView.count(
        // Create a grid with 2 columns
        crossAxisCount: 2,
        childAspectRatio: 8,
        padding: const EdgeInsets.all(1.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        // Generate 100 widgets that display their index in the List.
        children: legendElements);

    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: height),
      // adjust the height here
      child: grid,
    );
  }
}
