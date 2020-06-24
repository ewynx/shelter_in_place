import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/blue_transparent_button.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class AppreciateFeedbackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: powderBlue,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 130.0),
            Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                    AppLocalizations.of(context)
                        .translate('We appreciate your feedback!'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))),
            Image(
              image: AssetImage('logo3.png'),
              width: 150,
            ),
            SizedBox(height: 60.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              BlueTransparantButton(
                titleKeyName: 'Back to my overview',
                onPressed: () {
                  Navigator.pushNamed(context, 'summary');
                },
              )
            ])
          ],
        ),
      ),
    );
  }
}
