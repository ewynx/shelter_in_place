import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/util/colored_button.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class LightBlueButton extends StatelessWidget {
  LightBlueButton({@required this.titleKeyName, @required this.onPressed});

  final GestureTapCallback onPressed;
  final String titleKeyName;

  @override
  Widget build(BuildContext context) {
    return MyColoredButton(
        buttonColor: buttonBlue,
        borderColor: buttonBlue,
        titleKeyName: this.titleKeyName,
        onPressed: this.onPressed);
  }
}
