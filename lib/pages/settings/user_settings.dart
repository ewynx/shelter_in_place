import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/pages/util/blue_button.dart';
import 'package:shelter_in_place/pages/util/colors.dart';
import 'package:shelter_in_place/services/backend_service.dart';
import 'package:shelter_in_place/pages/util/colors.dart';

import '../localization/localizations.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final globalKey = GlobalKey<ScaffoldState>();

  // Form with validation
  final _formKey = GlobalKey<FormState>();
  String _currentPassword;
  String _newPassword;
  String _email;
  String _name;

  @override
  Widget build(BuildContext context) {
    final backendService = Provider.of<BackendService>(context);
    // Get current name of user
    final nameFuture = backendService.getName();

    return Scaffold(
      key: globalKey,
      appBar: AppBar(
          backgroundColor: darkSlateBlue,
          title: Text(AppLocalizations.of(context).translate('User settings'))),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Image(
                  image: AssetImage('logo3.png'),
                  width: 80,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      FutureBuilder<String>(
                          future: nameFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {
                                return ErrorWidget(snapshot.toString());
                              }
                              String name = snapshot.data ?? 'Name';
                              return TextFormField(
                                  initialValue: name,
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
                                  decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          )),
                                      filled: true,
                                      fillColor: lightGrey,
                                      hintText: "Name"));
                            } else {
                              return JumpingDotsProgressIndicator(
                                  fontSize: 100.0, color: Colors.blue);
                            }
                          }),
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
                          decoration: LightGreyInputDecoration(
                              context, 'email address')),
                      SizedBox(height: 20.0),
                      TextFormField(
                          cursorColor: darkSlateBlue,
                          style: TextStyle(color: darkSlateBlue, fontSize: 18),
                          onSaved: (value) => _currentPassword = value.trim(),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)
                                  .translate('Current password');
                            }
                            return null;
                          },
                          decoration: LightGreyInputDecoration(
                              context, 'Current password')),
                      SizedBox(height: 20.0),
                      TextFormField(
                          cursorColor: darkSlateBlue,
                          style: TextStyle(color: darkSlateBlue, fontSize: 18),
                          onSaved: (value) => _newPassword = value.trim(),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)
                                  .translate('New password');
                            }
                            return null;
                          },
                          decoration: LightGreyInputDecoration(
                              context, 'New password')),
                      SizedBox(height: 30.0),
                      BlueButton(
                        titleKeyName: 'Update settings',
                        onPressed: () {
                          validateSignUpSubmission(backendService);
                        },
                      )
                    ])))
          ],
        ),
      ),
    );
  }

  void validateSignUpSubmission(BackendService backendService) async {
    // save the input fields
    final form = _formKey.currentState;
    form.save();

    if (form.validate()) {
      try {
        // TODO 1: Firebase verification someone should only be able to make changes if they have the correct username/password combo

        // TODO 2: if a new password was entered, update on Firebase side

        // We save the name only locally and upon completion show a success message
        backendService.updateName(_name);
        final snackBar = SnackBar(
            content: Text(
              AppLocalizations.of(context).translate('Your settings have been updated'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: success);
        globalKey.currentState.showSnackBar(snackBar);
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

  InputDecoration LightGreyInputDecoration(
      BuildContext context, String keyName) {
    return InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            )),
        filled: true,
        fillColor: lightGrey,
        hintText: AppLocalizations.of(context).translate(keyName));
  }
}
