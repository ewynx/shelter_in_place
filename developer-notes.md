# Developer Notes
The purpose of this documentation is to help developers better understand the design of the app, including the backend authentication, data storage, and the various pages in the Flutter app.

## Contents
- [Pages in the Flutter App](#pages-in-the-flutter-app)
- [Style Guide](#style-guide)
- [Backend Storage](#backend-storage)

## Pages in the Flutter App
- [main.dart](#maindart)
- [social_distancing.dart](#social_distancingdart)
- [questions_controller.dart](#questions_controllerdart)
- [activities.dart](#activitiesdart)
- [feelings.dart](#feelingsdart)
- [note.dart](#notedart)
- [new_summary.dart](#new_summarydart)

### main.dart
This defines the main app widget and defines all the routes for the app.

### social_distancing.dart
The initial question page of the app, asking if the user practiced social distancing today. Depending on whether the user clicks the Yes or No button, the value of the `socialDistance` key in the `dayModel` model will either be updated with `true` or `false`. After making the selection, the app will navigate to `questions_controller.dart`.

### questions_controller.dart
This page will display each of the questions as the user clicks the `Next` button at the bottom on the screen. Each of the pages for the questions are imported as packages at the top of the page (activities.dart, feelings.dart, note.dart). These three packages are referenced when their corresponding are initialized as the `children` of the Scaffold body.

### activities.dart
This widget asks the user which activities they completed by displaying checkboxes for each activity. For each activity a user selects, the values in the `answers` hash map corresponding to each of those activities will be set to `true`. The `Constants.activities` list is set in the `shared_const.dart` file.

### feelings.dart
This widget asks the user for the various feelings they experienced throughout the day. Like `activities.dart`, each feeling is displayed as a checkbox. Selecting a feeling will also populate the `answers` hash map, setting the value for that feeling to `true`. The `Constants.feelings` list is set in the `shared_const.dart` file.

### note.dart
This page asks the user to input a note about the day. The string value of the note will be set to the `dayModel.note` hash map index. After clicking the `Next` button on this screen, the app will navigate to the summary page, `new_summary.dart`.

### new_summary.dart
This page displays a list of widgets for each day explicitly defined in this file, starting with an entry with today's date. Each widget contains summary information defined in `single_day_summary.dart`, which includes a list of activities and feelings and a note from that day. Each day is assigned a certain smiley face based on the aggregate score of feelings for that day. The scores for each feeling are defined in `mood_const.dart`.

## Style Guide

This section of the documentation explains some common styling aspects of the app, including common widgets and colors used.

### Loading Widget

As implemented in this commit, use the following widget on any loading screen:

```
import 'package:progress_indicators/progress_indicators.dart';
...
JumpingDotsProgressIndicator(fontSize: 100.0, color: Colors.blue);
```

See the [pub.dev documentation](https://pub.dev/packages/progress_indicators) for more information about `progress_indicators.dart`.

## Backend Storage

This section explains how user-inputted data is stored when using the app. Each new day entry is added to a JSON text file on the user's device. This file lives in the application documents directory for the Distince app. When the app is deleted from the user's device, this directory and its files will also be deleted.

The [backend_service.dart](lib/services/backend-service.dart) file performs all the backend storage operations in the app. This service uses the the [`path_provider`](https://pub.dev/packages/path_provider) plugin to retrieve the application documents directory for the app. When testing the application as a developer, the `getTemporaryDirectory()` method of the `path_provider` plugin allows the application to write any inputted data to a temporary directory that is deleted when the app is closed. See [this commit](https://github.com/ewynx/shelter_in_place/commit/53ca9c64c536a774cb80555dbeaf4d3205193c59#diff-a8fd228a78c5396c428a5dd4d4c0b8d0L14) for a commented-out example of how this was implemented.