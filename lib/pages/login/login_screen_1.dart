import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/util/colors.dart';
import 'package:shelter_in_place/pages/util/light_blue_button.dart';
import 'package:shelter_in_place/pages/util/transparant_button.dart';

import '../localization/localizations.dart';

class LoginFirstPage extends StatefulWidget {
  @override
  _LoginFirstPageState createState() => _LoginFirstPageState();
}

class _LoginFirstPageState extends State<LoginFirstPage> {
  final String logoName = 'logo3.png';
  final String wordmarkName = 'wordmark3.png';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(color: darkSlateBlue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('wordmark3.png'),
                  width: 200,
                )
              ],
            ),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          LightBlueButton(
                            titleKeyName: 'login button text',
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          TransparantButton(
                            titleKeyName: 'Create account',
                            onPressed: () {
                              Navigator.pushNamed(context, 'signup');
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ])
          ],
        ));
  }
}
