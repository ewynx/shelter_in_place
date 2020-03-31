import 'package:flutter/material.dart';

import 'colors.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
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
                      border: new Border.all(color: buttonBlue, width: 7.0),
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    ))
                : Container(
                    height: 24,
                    width: 24,
                    decoration: new BoxDecoration(
                      border: new Border.all(color: powderBlue, width: 2.0),
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    )),
            SizedBox(width: 10.0),
            Expanded(child: Text(label))
          ],
        ),
      ),
    );
  }
}
