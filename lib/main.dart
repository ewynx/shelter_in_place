import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/pages/home.dart';
import 'package:shelter_in_place/pages/questions/questions_controller.dart';
import 'package:shelter_in_place/pages/questions/social_distancing.dart';
import 'package:shelter_in_place/pages/settings/appreciate-feedback.dart';
import 'package:shelter_in_place/pages/settings/user-feedback.dart';
import 'package:shelter_in_place/pages/settings/user_settings.dart';
import 'package:shelter_in_place/services/backend_service.dart';
import 'package:shelter_in_place/services/days_service.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'auth.dart';
import 'models/day_model.dart';
import 'pages/localization/localizations.dart';
import 'pages/login/login_screen_1.dart';
import 'pages/login/login_screen_2.dart';
import 'pages/login/signup_screen.dart';

void main() => runApp(
      ChangeNotifierProvider<AuthService>(
          child: MyApp(), create: (context) => AuthService()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Day>(
            create: (context) => Day(),
          ),
          Provider<DaysService>(
            create: (context) => DaysService(),
          ),
          Provider<BackendService>(
            create: (context) => BackendService(),
          )
        ],
        child: MaterialApp(
            title: 'distINce',
            theme: ThemeData(fontFamily: 'Gilroy'),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en'), // English
              const Locale('es'), // Spanish
              const Locale('nl') // Dutch
            ],
            home: FutureBuilder(
              future: Provider.of<AuthService>(context).getUser(),
              builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    Provider.of<AuthService>(context).setAuthServiceUserData(snapshot.data);
                    return SocialDistancing();
                  }
                  else {
                    return LoginFirstPage();
                  }
                } else {
                  // show loading indicator
                  return JumpingDotsProgressIndicator(fontSize: 100.0, color: Colors.blue);
                  // return LoadingCircle();
                }
              },
            ),
            onGenerateRoute: (routeSettings) {
              // Use names routes to prevent duplicate code
              if (routeSettings.name == 'first-question') {
                return MaterialPageRoute(
                  builder: (context) => SocialDistancing(),
                );
              } else if (routeSettings.name == 'other-questions') {
                return MaterialPageRoute(
                  builder: (context) => QuestionsController(),
                );
              } else if (routeSettings.name == 'summary') {
                return MaterialPageRoute(
                  builder: (context) => HomePage(),
                );
              } else if (routeSettings.name == 'signup') {
                return MaterialPageRoute(
                  builder: (context) => SignupPage(),
                );
              } else if (routeSettings.name == 'splash-screen') {
                return MaterialPageRoute(
                  builder: (context) => LoginFirstPage(),
                );
              } else if (routeSettings.name == 'login') {
                return MaterialPageRoute(
                  builder: (context) => LoginSecondPage(),
                );
              } else if (routeSettings.name == 'user-settings') {
                return MaterialPageRoute(
                  builder: (context) => UserSettings(),
                );
              } else if (routeSettings.name == 'feedback-page') {
                return MaterialPageRoute(
                  builder: (context) => UserFeedbackWidget(),
                );
              } else if (routeSettings.name == 'appreciate-feedback') {
                return MaterialPageRoute(
                  builder: (context) => AppreciateFeedbackWidget(),
                );
              }
              return null;
            }));
  }
}

// Not being used yet, but nice for when Firebase implementation is in place
class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
