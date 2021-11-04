import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:informationbroker/models/SwCard.dart';
import 'package:informationbroker/models/FilterSet.dart';
import 'package:card_settings/card_settings.dart';

class FilterForm extends StatefulWidget {
  FilterForm({Key? key, required this.cardPool}) : super(key: key);

  final List<SwCard> cardPool;

  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  List<SwCard> get _cardPool => widget.cardPool;
  FilterSet get _filterSet => Provider.of<FilterSet>(context, listen: false);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(_cardPool.length);

    return Form(
        key: _formKey,
        child: CardSettings.sectioned(
            // showMaterialonIOS: true,
            children: <CardSettingsSection>[
              CardSettingsSection(
                header: CardSettingsHeader(
                  label: "Includes",
                ),
                children: <CardSettingsWidget>[
                  CardSettingsCheckboxPicker(
                    label: "Side",
                    options: ["Dark", "Light"],
                    initialValues: [],
                  ),
                  CardSettingsCheckboxPicker(
                    label: "Type",
                    options: SwCard.allTypes(_cardPool),
                    initialValues: [],
                  ),
                  CardSettingsCheckboxPicker(
                    label: "SubType Classes",
                    options: SwCard.allSubTypeClasses(_cardPool),
                    initialValues: [],
                  ),
                  CardSettingsCheckboxPicker(
                    label: "SubType",
                    options: SwCard.allSubTypes(_cardPool),
                    initialValues: [],
                  ),
                  CardSettingsCheckboxPicker(
                    label: "Set",
                    options: SwCard.allSets(_cardPool),
                    initialValues: [],
                  ),
                  CardSettingsText(
                    label: "Lore",
                    initialValue: "",
                  ),
                  CardSettingsText(
                    label: "Gametext",
                    initialValue: "",
                  ),
                  CardSettingsCheckboxPicker(
                    label: "Icons",
                    options: SwCard.allIcons(_cardPool),
                    initialValues: [],
                  ),
                ],
              ),
              CardSettingsSection(
                  header: CardSettingsHeader(
                    label: "Stats",
                  ),
                  children: <CardSettingsWidget>[
                    CardSettingsCheckboxPicker(
                      label: "Destiny",
                      options: SwCard.allDestinies(_cardPool),
                      initialValues: [],
                    ),
                    CardSettingsCheckboxPicker(
                      label: "Deploy",
                      options: SwCard.allDeploys(_cardPool),
                      initialValues: [],
                    ),
                    CardSettingsCheckboxPicker(
                      label: "Forfeit",
                      options: SwCard.allForfeits(_cardPool),
                      initialValues: [],
                    ),
                    CardSettingsCheckboxPicker(
                      label: "Power",
                      options: SwCard.allPowers(_cardPool),
                      initialValues: [],
                    ),
                    CardSettingsCheckboxPicker(
                      label: "Ability",
                      options: SwCard.allAbilities(_cardPool),
                      initialValues: [],
                    ),
                    CardSettingsCheckboxPicker(
                      label: "Maneuver",
                      options: SwCard.allManeuvers(_cardPool),
                      initialValues: [],
                    ),
                    CardSettingsCheckboxPicker(
                      label: "Armor",
                      options: SwCard.allArmors(_cardPool),
                      initialValues: [],
                    ),
                  ]),
            ]));
  }
}
