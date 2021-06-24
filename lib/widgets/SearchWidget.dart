import 'package:flutter/material.dart';
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
  late final searchWidgetController = TextEditingController();
  late List<SwCard> _cardPool;
  late List<SwCard> _foundCards;

  void initState() {
    _cardPool = widget.cardPool;
    _foundCards = List<SwCard>.from(_cardPool);
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
            _foundCards = _foundCards.where((element) {
              // TODO: apostrophes, and maybe other letters don't work here
              return SwCard.comparisonTitle(element.title)
                  .contains(SwCard.comparisonTitle(text));
            }).toList();

            print(_foundCards.length);

            setState(() {
              widget.onSearch(_foundCards);
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Search cards by title'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Showing ${_foundCards.length} cards"),
        ),
      ],
    );
  }
}
