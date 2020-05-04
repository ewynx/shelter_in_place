import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class SocialDistancing extends StatefulWidget {
  @override
  _SocialDistancingState createState() => _SocialDistancingState();
}

class _SocialDistancingState extends State<SocialDistancing> {
  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);
    final String assetName = '-g-distanceGraphic.svg';

    return SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0),
                SvgPicture.asset(assetName),
                SizedBox(height: 20.0),
                Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                    child: Text(
                        AppLocalizations.of(context)
                            .translate('question social distancing'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  yesButton(context, 'yes', dayModel),
                  SizedBox(height: 20.0),
                  noButton(context, 'no', dayModel)
                ]),
              ],
            ),
          ),
        ));
  }
}

SizedBox yesButton(BuildContext context, String keyname, Day dayModel) {
  return new SizedBox(
      width: 300.0,
      height: 60.0,
      child: RaisedButton(
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        color: buttonBlue,
        child: Text(AppLocalizations.of(context).translate(keyname),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () {
          dayModel.socialDistance = true;
          Navigator.pushNamed(context, 'other-questions');
        },
      ));
}
SizedBox noButton(BuildContext context, String keyname, Day dayModel) {
  return new SizedBox(
      width: 300.0,
      height: 60.0,
      child: RaisedButton(
        textColor: buttonBlue,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        color: powderBlue,
        child: Text(AppLocalizations.of(context).translate(keyname),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () {
          dayModel.socialDistance = false;
          Navigator.pushNamed(context, 'other-questions');
        },
      ));
}
