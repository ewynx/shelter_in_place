import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/settings/settings_overview.dart';
import 'package:shelter_in_place/pages/summary/days_tracker.dart';
import 'package:shelter_in_place/pages/util/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelter_in_place/pages/util/pref_keys.dart';

import 'lifecycle_event_handler.dart';
import 'lifecycle_event_handler.dart';
import 'summary/mood_tracker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    NewSummary(),
    MyOverviewChart(),
    SettingsOverview(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(new LifecycleEventHandler(
        resumeCallBack: () async => _refreshContent()));
  }

  void _refreshContent() async {
    var now = DateTime.now();
    var dateAnsweredString = now.toIso8601String();
    try {
      final prefs = await SharedPreferences.getInstance();
      dateAnsweredString =
          prefs.getString(SharedPreferencesKeys.DATE_ANSWERED) ??
              now.toIso8601String();
    } catch (error) {
      debugPrint(
          "Something went wrong getting lastTimeFilledOut from local storage");
    }

    var dateAnswered = DateTime.parse(dateAnsweredString);

    // App has not been opened today, so we navigate to the questionnaire
    if (new DateTime(now.year, now.month, now.day) !=
        new DateTime(dateAnswered.year, dateAnswered.month, dateAnswered.day)) {
      Navigator.pushNamed(context, 'first-question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            title: Text('Overview'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: buttonBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
