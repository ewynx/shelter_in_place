import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/settings/settings_overview.dart';
import 'package:shelter_in_place/pages/summary/new_summary.dart';
import 'package:shelter_in_place/pages/util/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelter_in_place/pages/util/pref_keys.dart';

import 'lifecycle_event_handler.dart';
import 'overview_charts.dart';

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
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(SharedPreferencesKeys.DATE_ANSWERED)) {
        String dateAnsweredString = prefs.getString(SharedPreferencesKeys.DATE_ANSWERED);
        var nowString = DateTime.now().toIso8601String();
        DateTime dateAnswered = DateTime.parse(dateAnsweredString);
        DateTime today = DateTime.parse(nowString);
        if (dateAnswered.year == today.year && dateAnswered.month == today.month && dateAnswered.day == today.day) {
          Navigator.pushNamed(context, 'summary');
        }
      }
    } catch (error) {
      debugPrint(
          "Something went wrong getting lastTimeFilledOut from local storage");
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
