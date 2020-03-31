import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';

class LegendElement extends StatelessWidget {
  LegendElement(
      {@required this.keyName, @required this.fontsize, @required this.colors});

  final String keyName;
  final double fontsize;
  final HashMap<String, Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: <Widget>[
      Container(
        height: 15,
        width: 15,
        margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
        decoration:
            BoxDecoration(color: colors[keyName], shape: BoxShape.circle),
      ),
      new Flexible(
          child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(AppLocalizations.of(context).translate(keyName),
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: fontsize,
                  ))))
    ]));
  }
}
