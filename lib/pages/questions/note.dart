import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class NoteForDay extends StatefulWidget {
  @override
  _NoteForDayState createState() => _NoteForDayState();
}

class _NoteForDayState extends State<NoteForDay> {
  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 60.0),
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(AppLocalizations.of(context).translate('note today'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Container(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppLocalizations.of(context)
                                .translate('note today hint')),
                        onChanged: (text) {
                          dayModel.note = text;
                        },
                      )),
                  decoration: new BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(8),
                    shape: BoxShape.rectangle,
                  ))),
        ],
      ),
    );
  }
}
