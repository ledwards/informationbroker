import 'dart:convert' show json;
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/SwCard.dart';

class Loader {
  Loader(this.context);
  final BuildContext context;

  Future<List<SwCard>> cards() async {
    List<SwCard> cards = [];

    for (String f in ['data/cards/Light.json', 'data/cards/Dark.json']) {
      await rootBundle.loadString(f).then((data) {
        final cardsData = json.decode(data);
        cards.addAll(SwCard.listFromJson(cardsData['cards']));
      });
    }
    return cards.toList();
  }
}
