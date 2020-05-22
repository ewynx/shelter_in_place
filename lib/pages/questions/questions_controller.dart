import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/questions/activities.dart';
import 'package:shelter_in_place/pages/questions/feelings.dart';
import 'package:shelter_in_place/pages/questions/my_back_button.dart';
import 'package:shelter_in_place/pages/questions/note.dart';
import 'package:shelter_in_place/pages/questions/question_bottom_bar.dart';
import 'package:shelter_in_place/services/backend_service.dart';
import 'package:shelter_in_place/services/days_service.dart';

import 'my_continue_button.dart';

class QuestionsController extends StatefulWidget {
  QuestionsController({Key key}) : super(key: key);

  _QuestionsControllerState createState() => _QuestionsControllerState();
}

class _QuestionsControllerState extends State<QuestionsController> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final day = Provider.of<Day>(context);
    final dayService = Provider.of<DaysService>(context);
    final backendService = Provider.of<BackendService>(context);
    day.activities = new Set();
    day.feelings = new Set();

    CustomContinueButton continueButton = CustomContinueButton(
      onPressed: () async {
        DateTime currentDate = DateTime.now();
        day.date = currentDate;
        day.id = currentDate.month.toString() + currentDate.day.toString() + currentDate.year.toString() + currentDate.millisecond.toString();
        // print(day.date);
        // print(day.date.toUtc());
        // print(day.date.toLocal());
        // print(day.date.toUtc().toLocal());
        await dayService.addDocument(day.toJson());
        double _pageIndex = _pageController.page.roundToDouble();
        if (_pageController.hasClients && _pageIndex < 2) {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut);
        } else {
          backendService.addDay(day);
          Navigator.pushNamed(context, 'summary');
        }
      },
    );

    CustomBackButton backButton = CustomBackButton(
      onPressed: () {
        double _pageIndex = _pageController.page.roundToDouble();
        if (_pageIndex == 0.0) {
          Navigator.pushNamed(context, 'first-question');
        } else if (_pageController.hasClients) {
          _pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut);
        }
      },
    );

    return Scaffold(
        bottomNavigationBar: QuestionBottomBar(
          controller: _pageController,
          continueButton: continueButton,
          backButton: backButton,
        ),
        body: PageView(
          controller: _pageController,
          children: [Activities(), Feelings(), NoteForDay()],
        ));
  }
}
