import 'package:flutter/material.dart';
import 'package:informationbroker/main.dart';
import 'package:informationbroker/models/SwCard.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key, required this.cardPool, required this.onSearch})
      : super(key: key);

  final List<SwCard> cardPool;
  final Function onSearch;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final searchWidgetController = TextEditingController();

  @override
  void dispose() {
    searchWidgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        List<SwCard> foundCards = widget.cardPool.where((element) =>
            // TODO: apostrophes, and maybe other letters don't work here
            element.title.toLowerCase().contains(text.toLowerCase())).toList();

        setState(() {
          widget.onSearch(foundCards);
        });
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: 'Search by title'),
    );
  }
}
