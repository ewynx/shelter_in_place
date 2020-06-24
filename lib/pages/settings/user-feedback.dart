import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/blue_button.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class UserFeedbackWidget extends StatelessWidget {
  final globalKey = GlobalKey<ScaffoldState>();
  String feedbackText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(backgroundColor: darkSlateBlue),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                    AppLocalizations.of(context)
                        .translate('Let us know what you think'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))),
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 30),
                child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          minLines: 8,
                          maxLines: 15,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: AppLocalizations.of(context).translate(
                                  'Leave your feedback and suggestions here')),
                          onChanged: (text) {
                            this.feedbackText = text;
                          },
                        )),
                    decoration: new BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              BlueButton(
                titleKeyName: 'Send',
                onPressed: () async {
                  final Email email = Email(
                    body: this.feedbackText,
                    subject: 'Distince App feedback',
                    recipients: ['elena@ceratech.io'],
//                    cc: ['cc@example.com'],
                    isHTML: false,
                  );

                  await FlutterEmailSender.send(email);

                  Navigator.pushNamed(context, 'appreciate-feedback');
                },
              )
            ])
          ],
        ),
      ),
    );
  }
}
