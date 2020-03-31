import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/pages/util/blue_button.dart';
import 'package:shelter_in_place/pages/util/white_forward_button.dart';

import '../../auth.dart';

class SettingsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
        child: Column(children: [
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: WhiteForwardButton(
                        titleKeyName: 'User settings',
                        onPressed: () {
                          Navigator.pushNamed(context, 'user-settings');
                        },
                      )))
            ],
          ),
          Row(children: <Widget>[
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: WhiteForwardButton(
                      titleKeyName: 'Notification settings',
                      onPressed: () {
                        Navigator.pushNamed(context, 'notification-settings');
                      },
                    )))
          ]),
          Row(children: <Widget>[
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: BlueButton(
                      titleKeyName: 'Logout',
                      onPressed: () async {
                        print('logout');
                        await Provider.of<AuthService>(context).logout();
                        print('logout');
                        Navigator.pushNamed(context, 'login');
                      },
                    )))
          ])
        ]));
  }
}
