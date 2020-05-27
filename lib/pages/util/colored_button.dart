import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class MyColoredButton extends StatelessWidget {
  MyColoredButton({@required this.buttonColor, @required this.borderColor, @required this.titleKeyName, @required this.onPressed});

  final GestureTapCallback onPressed;
  final String titleKeyName;
  final Color buttonColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        child:FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(
            color: borderColor, //Color of the border
            style: BorderStyle.solid, //Style of the border
            width: 2, //width of the border
          )
        ),

        color: buttonColor,
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
        }));
  }
}
