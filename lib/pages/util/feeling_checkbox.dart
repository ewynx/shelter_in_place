import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';

import 'colors.dart';

class FeelingCheckbox extends StatelessWidget {
  const FeelingCheckbox({
    this.keyName,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String keyName;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            value
                ? Container(
                    height: 24,
                    width: 24,
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Constants().colorsFeelings()[keyName], width: 7.0),
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    ))
                : Container(
                    height: 24,
                    width: 24,
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Constants().colorsFeelings()[keyName], width: 2.0),
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    )),
            SizedBox(width: 10.0),
            Expanded(child: Text(AppLocalizations.of(context).translate(keyName)))
          ],
        ),
      ),
    );
  }
}
