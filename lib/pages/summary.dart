import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

final List<dynamic> dates = <dynamic>[
  'Sunday, March 22',
  'Saturday, March 21',
  'Friday, March 20',
  'Thursday, March 19',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
  'Wednesday, March 18',
];

class Summary extends StatefulWidget {
//  final String userEmail;

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  bool _isVisible = false;

  void showRow() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context).translate('summary bar title')),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Text(AppLocalizations.of(context).translate('summary header'),
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 50.0),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: dates.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      showRow();
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          color: Colors.blue[100],
                          child: Center(child: Text('${dates[index]}')),
                        ),
                        Visibility(
                          child: Text("Hidden widget!"),
                          visible: _isVisible,
                        )
                      ],
                    ));
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )
          ],
        )));
  }
}
