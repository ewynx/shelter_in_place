import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class IconLegendElement extends StatelessWidget {
  IconLegendElement(
      {@required this.keyName,
      @required this.fontsize,
      @required this.iconData});

  final String keyName;
  final double fontsize;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(iconData, size: 30.0)]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(AppLocalizations.of(context).translate(keyName),
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
              fontSize: fontsize,
            ))
      ])
    ]));
  }
}
