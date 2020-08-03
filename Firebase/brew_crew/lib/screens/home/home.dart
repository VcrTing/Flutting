import 'package:brew_crew/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/service/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './brew_list.dart';
import '../../models/brew.dart';
import './settings_form.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  void _showSettingsPanel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
        child: Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: Text('Brew Crew'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
                FlatButton.icon(
                    onPressed: () => _showSettingsPanel(context),
                    icon: Icon(Icons.settings),
                    label: Text('settings'))
              ],
            ),
            body: Container(
              child: BrewList(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover,
              )),
            )));
  }
}
