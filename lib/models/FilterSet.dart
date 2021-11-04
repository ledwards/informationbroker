import 'package:flutter/widgets.dart';
import 'package:informationbroker/models/SwCard.dart';

class FilterSet with ChangeNotifier {
  late final List<SwCard> cardPool;
  String? titleSearchTerm;
  String? gametextSearchTerm;

  List<SwCard> get cards {
    // TODO: apostrophes, and maybe other letters don't work here
    List<SwCard> _titleSearchedCards = titleSearchTerm == null
        ? cardPool
        : cardPool.where((element) {
            return SwCard.comparisonTitle(element.title)
                .contains(SwCard.comparisonTitle(titleSearchTerm!));
          }).toList();

    List<SwCard> _gametextSearchedCards = titleSearchTerm == null
        ? cardPool
        : cardPool.where((card) {
            return card.gametext.contains(gametextSearchTerm!);
          }).toList();

    return _titleSearchedCards;
  }

  void setSearchTerm(query) {
    titleSearchTerm = query;
    notifyListeners();
  }
}
