import 'package:flutter/widgets.dart';
import 'package:informationbroker/models/SwCard.dart';

class SwCardsList with ChangeNotifier {
  List<SwCard> cards = [];
  int get length => cards.length;
  operator [](int index) => cards[index];

  bool isEmpty() => cards.isEmpty;

  void set(List<SwCard>? newCards) {
    cards = List<SwCard>.from(newCards ?? []);
    notifyListeners();
  }
}
