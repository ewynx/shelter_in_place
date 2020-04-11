import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/questions/my_continue_button.dart';
import 'package:shelter_in_place/pages/util/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'my_back_button.dart';

class QuestionBottomBar extends StatelessWidget {
  QuestionBottomBar(
      {@required this.controller,
      @required this.continueButton,
      @required this.backButton});

  final CustomContinueButton continueButton;
  final CustomBackButton backButton;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              backButton,
              SmoothPageIndicator(
                controller: controller, // PageController
                count: 3,
                effect:
                    WormEffect(activeDotColor: buttonBlue, dotColor: lightGrey), // your preferred effect
              ),
              continueButton,
            ],
          )),
    );
  }
}
