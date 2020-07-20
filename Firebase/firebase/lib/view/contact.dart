import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var myLocale = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: fromBuilder(),
    );
  }

  Widget fromBuilder() {
    return FormBuilder(
      key: _fbKey,
      autovalidate: true,
      child: ListView(
        children: <Widget>[
          FormBuilderTextField(
            attribute: "name",
            validators: [
              FormBuilderValidators.min(3),
              FormBuilderValidators.required()
            ],
            decoration: InputDecoration(
                labelText: AppLocalizations(myLocale).translate('contactName')),
          ),
          FormBuilderTextField(
            attribute: "email",
            validators: [
              FormBuilderValidators.email(),
              FormBuilderValidators.required()
            ],
            decoration: InputDecoration(
                labelText:
                    AppLocalizations(myLocale).translate('contactEmail')),
          ),
          FormBuilderFilterChip(
            decoration: InputDecoration(
                labelText: AppLocalizations(myLocale).translate('contactQuery'),
                labelStyle:
                    TextStyle(fontSize: 21, fontWeight: FontWeight.normal)),
            attribute: "category",
            options: [
              FormBuilderFieldOption(
                  child: Text(AppLocalizations(myLocale).translate('mobile')),
                  value: "mobile"),
              FormBuilderFieldOption(
                  child: Text(AppLocalizations(myLocale).translate('web')),
                  value: "web"),
              FormBuilderFieldOption(
                  child: Text(AppLocalizations(myLocale).translate('vr')),
                  value: "vr"),
              FormBuilderFieldOption(
                  child:
                      Text(AppLocalizations(myLocale).translate('contactAR')),
                  value: "ar"),
              FormBuilderFieldOption(
                  child: Text(
                      AppLocalizations(myLocale).translate('contactWearable')),
                  value: "wearable"),
              FormBuilderFieldOption(
                  child: Text(AppLocalizations(myLocale).translate('research')),
                  value: "research"),
            ],
          ),
          FormBuilderTextField(
            attribute: 'details',
            maxLines: 5,
            validators: [FormBuilderValidators.required()],
            decoration: InputDecoration(
                labelText:
                    AppLocalizations(myLocale).translate('contactMessage')),
          )
        ],
      ),
    );
  }
}
