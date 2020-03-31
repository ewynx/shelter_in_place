import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.grey[500],
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      child: Text(AppLocalizations.of(context).translate('back'),
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          )),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
