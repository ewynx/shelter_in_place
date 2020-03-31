import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class CustomContinueButton extends StatelessWidget {
  CustomContinueButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        width: 100.0,
        height: 45.0,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 0),
            child: RaisedButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              color: buttonBlue,
              child: Text(
                  AppLocalizations.of(context)
                      .translate('continue button text'),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                this.onPressed();
              },
            )));
  }
}
