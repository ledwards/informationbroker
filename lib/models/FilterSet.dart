import 'package:flutter/widgets.dart';
import 'package:informationbroker/models/SwCard.dart';

class FilterSet with ChangeNotifier {
  late final List<SwCard> cardPool;
  String? searchTerm;

  List<SwCard> get cards {
    // TODO: apostrophes, and maybe other letters don't work here
    List<SwCard> _searchedCards = searchTerm == null
        ? cardPool
        : cardPool.where((element) {
            return SwCard.comparisonTitle(element.title)
                .contains(SwCard.comparisonTitle(searchTerm!));
          }).toList();

    return _searchedCards;
  }

  void setSearchTerm(query) {
    searchTerm = query;
    notifyListeners();
  }
}
