import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shelter_in_place/pages/util/light_blue_button.dart';
import '../../auth.dart';
import '../localization/localizations.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Form with validation
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;
  String _name;
  final String logoName = 'logo3.png';
  final String wordmarkName = 'wordmark3.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: EdgeInsets.all(20.0),
            decoration: new BoxDecoration(color: darkSlateBlue),
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0),
                Image(
                  image: AssetImage('wordmark3.png'),
                  width: 200,
                ),
                Container(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          SizedBox(height: 20.0),
                          TextFormField(
                              cursorColor: darkSlateBlue,
                              style: TextStyle(
                                  color: darkSlateBlue,
                                  fontSize: 18,
                                  decorationColor: Colors.white),
                              onSaved: (value) => _name = value.trim(),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .translate('enter name');
                                }
                                return null;
                              },
                              decoration:
                                  WhiteInputDecoration(context, 'name')),
                          SizedBox(height: 20.0),
                          TextFormField(
                              cursorColor: darkSlateBlue,
                              style: TextStyle(
                                  color: darkSlateBlue,
                                  fontSize: 18,
                                  decorationColor: Colors.white),
                              onSaved: (value) => _email = value.trim(),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .translate('enter email');
                                }
                                return null;
                              },
                              decoration: WhiteInputDecoration(
                                  context, 'email address')),
                          SizedBox(height: 20.0),
                          TextFormField(
                              cursorColor: darkSlateBlue,
                              style:
                                  TextStyle(color: darkSlateBlue, fontSize: 18),
                              onSaved: (value) => _password = value.trim(),
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .translate('enter password');
                                }
                                return null;
                              },
                              decoration:
                                  WhiteInputDecoration(context, 'password')),
                          SizedBox(height: 80.0),
                          LightBlueButton(
                            titleKeyName: 'Sign up',
                            onPressed: validateSignUpSubmission,
                          ),
                          SizedBox(height: 20.0),
                          ButtonTheme(
                            minWidth: 200.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                  AppLocalizations.of(context)
                                      .translate('go back'),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: transparent,
                            ),
                          )
                        ])))
              ],
            )));
  }

  InputDecoration WhiteInputDecoration(BuildContext context, String keyName) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        hintText: AppLocalizations.of(context).translate(keyName));
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

    //TODO how can we save the name locally?
  }

  _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text(AppLocalizations.of(context).translate('cancel')),
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
