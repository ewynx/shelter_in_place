import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class BlueButton extends StatelessWidget {
  BlueButton({@required this.titleKeyName, @required this.onPressed});

  final GestureTapCallback onPressed;
  final String titleKeyName;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        color: darkSlateBlue,
        textColor: Colors.white,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Align(
                  alignment: Alignment.center,
                  child:
                      Text(AppLocalizations.of(context).translate(titleKeyName),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )))),
        ),
        onPressed: () {
          this.onPressed();
        });
  }
}
