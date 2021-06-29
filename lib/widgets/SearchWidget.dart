import 'package:flutter/material.dart';
import 'package:informationbroker/models/FilterSet.dart';
import 'package:provider/provider.dart';
import 'package:informationbroker/models/SwCard.dart';
import 'package:informationbroker/models/SwCardsList.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget(List<SwCard> currentCards, {Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final searchWidgetController = TextEditingController();
  FilterSet get _filterSet => Provider.of<FilterSet>(context, listen: false);

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchWidgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (text) {
            setState(() {
              _filterSet.setSearchTerm(text);
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Search cards by title'),
        ),
      ],
    );
  }
}
