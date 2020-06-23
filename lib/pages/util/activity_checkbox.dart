import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';

import 'colors.dart';

class ActivityCheckbox extends StatelessWidget {
  const ActivityCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
    this.iconData
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;
  final IconData iconData;

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
                ? Icon(iconData, size: 30.0, color: grey)
                : Icon(iconData, size: 30.0, color: darkerGrey),
            SizedBox(width: 10.0),
            Expanded(child: Text(label))
          ],
        ),
      ),
    );
  }
}
