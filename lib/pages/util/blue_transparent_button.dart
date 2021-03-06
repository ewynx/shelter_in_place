import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/util/colored_button.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class BlueTransparantButton extends StatelessWidget {
  BlueTransparantButton(
      {@required this.titleKeyName, @required this.onPressed});

  final GestureTapCallback onPressed;
  final String titleKeyName;

  @override
  Widget build(BuildContext context) {
    return MyColoredButton(
      buttonColor: transparent,
      borderColor: darkSlateBlue,
      titleKeyName: this.titleKeyName,
      onPressed: this.onPressed,
      textColor: darkSlateBlue,
    );
  }
}
