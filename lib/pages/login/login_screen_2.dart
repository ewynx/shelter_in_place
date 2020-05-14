import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../auth.dart';
import '../localization/localizations.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class LoginSecondPage extends StatefulWidget {
  @override
  _LoginSecondPageState createState() => _LoginSecondPageState();
}

class _LoginSecondPageState extends State<LoginSecondPage> {
  // Form with validation
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;
  final String logoName = 'logo3.png';
  final String wordmarkName = 'wordmark3.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
                      decoration: new BoxDecoration(color: darkSlateBlue),
            child: Column(
              
      children: <Widget>[
         SizedBox(height: 50.0),
                Image(image: AssetImage('wordmark3.png'), width: 200,),
        Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  SizedBox(height: 20.0),
                  TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white, fontSize: 22, decorationColor: Colors.white),
                      
                      onSaved: (value) => _email = value.trim(),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context)
                              .translate('enter email');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: AppLocalizations.of(context)
                              .translate('email address'))),
                  TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      onSaved: (value) => _password = value.trim(),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context)
                              .translate('enter password');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: AppLocalizations.of(context)
                              .translate('password'))),
                  SizedBox(height: 40.0),
                  ButtonTheme(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15),
                      color: pink,
                      child: Text(
                          AppLocalizations.of(context)
                              .translate('login button text'),
                          style: TextStyle(
                              color: darkBlueButton,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                      onPressed: validateLoginSubmission,
                    ),
                    minWidth: 200,
                  ),
                  SizedBox(height: 20.0),
                  ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      // child: Text(AppLocalizations.of(context).translate('sign-up button text')),
                      padding: EdgeInsets.all(15),
                      child: Text("Sign Up",
                          style: TextStyle(
                              color: darkBlueButton,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                      onPressed: validateSignUpSubmission,
                      color: yellow,
                    ),
                  )
                ])))
      ],
    )));
  }

  void validateLoginSubmission() async {
    // save the input fields
    final form = _formKey.currentState;
    form.save();

    if (form.validate()) {
      try {
        FirebaseUser result = await Provider.of<AuthService>(context)
            .loginUser(email: _email, password: _password);
        print(result);
        // Jump into the questionnaire
        Navigator.pushNamed(context, 'first-question');
      } on AuthException catch (error) {
        // handle the firebase specific error
        return _buildErrorDialog(context, error.message);
      } on Exception catch (error) {
        // gracefully handle anything else that might happen..
        return _buildErrorDialog(context, error.toString());
      }
    }
  }

  void validateSignUpSubmission() async {
    // save the input fields
    final form = _formKey.currentState;
    form.save();

    if (form.validate()) {
      try {
        FirebaseUser result = await Provider.of<AuthService>(context)
            .createUser(email: _email, password: _password);
        print(result);
        // Jump into the questionnaire
        Navigator.pushNamed(context, 'first-question');
      } on AuthException catch (error) {
        // handle the firebase specific error
        return _buildErrorDialog(context, error.message);
      } on Exception catch (error) {
        // gracefully handle anything else that might happen..
        return _buildErrorDialog(context, error.toString());
      }
    }
  }

  _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          // title: Text(AppLocalizations.of(context).translate('error message')),
          title: Text("Error"),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                // child: Text(AppLocalizations.of(context).translate('cancel')),
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}
