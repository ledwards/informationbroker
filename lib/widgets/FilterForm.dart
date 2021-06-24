import 'package:flutter/material.dart';
import 'package:informationbroker/models/SwCard.dart';
import 'package:card_settings/card_settings.dart';

class FilterForm extends StatefulWidget {
  FilterForm({Key? key, required this.onFilter}) : super(key: key);

  final Function onFilter;

  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  String title = "Spheria";
  String author = "Cody Leet";
  String url = "http://www.codyleet.com/spheria";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: CardSettings(children: <CardSettingsSection>[
          CardSettingsSection(
            header: CardSettingsHeader(
              label: 'Favorite Book',
            ),
            children: <CardSettingsWidget>[
              CardSettingsCheckboxPicker(
                label: 'test',
                options: ['option', 'opt2', 'opt3'],
              ),
              CardSettingsText(
                label: 'Title',
                initialValue: title,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Title is required.';
                },
                onSaved: (value) => title = value ?? "",
              ),
              CardSettingsText(
                label: 'URL',
                initialValue: url,
                validator: (value) {
                  if (!value!.startsWith('http:'))
                    return 'Must be a valid website.';
                },
                onSaved: (value) => url = value ?? "",
              ),
            ],
          ),
        ]));
  }
}
