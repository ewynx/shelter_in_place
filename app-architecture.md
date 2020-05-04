# App Architecture
The purpose of this documentation is to help developers better understand the architecture of the app, including the backend authentication, data storage, and the various pages in the Flutter app.

## Contents
- [Pages in the Flutter App](#pages-in-the-flutter-app)

## Pages in the Flutter App
- [main.dart](#main.dart)
- [social_distancing.dart](#social_distancing.dart)
- [questions_controller.dart](#questions_controller.dart)
- [activities.dart](#activities.dart)

### main.dart
This defines the main app widget and defines all the routes for the app.

### social_distancing.dart
The initial question page of the app, asking if the user practiced social distancing today. Depending on whether the user clicks the Yes or No button, the value of the `socialDistance` key in the `dayModel` model will either be updated with `true` or `false`. After making the selection, the app will navigate to `questions_controller.dart`.

### questions_controller.dart
This page will display each of the questions as the user clicks the `Next` button at the bottom on the screen. Each of the pages for the questions are imported as packages at the top of the page (activities.dart, feelings.dart, note.dart). These three packages are referenced when their corresponding are initialized as the `children` of the Scaffold body.

### activities.dart
This widget asks the user which activities they completed by displaying checkboxes for each activity.