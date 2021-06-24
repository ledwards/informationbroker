import 'package:informationbroker/models/SwExpansions.dart';

class SwCard {
  int id;
  String side;
  String title;
  String? backTitle;
  String imageUrl;
  String? backImageUrl;
  String type;
  String? subType;
  String gametext;
  String? backGametext;
  String? lore;
  int? lightSideIcons;
  int? darkSideIcons;
  List<String> icons;
  List<String> characteristics;
  String set;
  String uniqueness;

  SwCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        side = json['side'],
        title = normalizeTitle(json['front']['title']),
        type = json['front']['type'],
        subType = json['front']['subType'],
        gametext = json['front']['gametext'] ?? "",
        lore = json['front']['lore'],
        lightSideIcons = json['front']['lightSideIcons'],
        darkSideIcons = json['front']['darkSideIcons'],
        icons = castListString(json['front']['icons']),
        characteristics = castListString(json['front']['characteristics']),
        set = setName(json['set']) ?? json['set'],
        uniqueness = json['front']['uniqueness'] ?? "",
        imageUrl = json['front']['imageUrl'],
        backImageUrl = json['back'] != null ? json['back']['imageUrl'] : null,
        backGametext = json['back'] != null ? json['back']['gametext'] : null,
        backTitle = json['back'] != null ? json['back']['title'] : null;

  List<String> _cardsWithDupes = [
    'Sense',
    'Alter',
    'Control',
    'Boba Fett',
    'Tatooine',
    'Coruscant',
    'Jawa',
    'Tusken Raider'
  ];

  String get _typeSuffix =>
      subType == null ? "" : " - ${(subType ?? '').split(':')[0]}";

  String get displayTitle => "$displayUniqueness$title $displaySet";
  String get displaySet => _cardsWithDupes.contains(title) ? "($set)" : '';
  String get displayType => "$type$_typeSuffix";
  // TODO: PR the datset: Some AIs and V-cards don't have uniqueness field set
  String get displayUniqueness =>
      uniqueness.replaceAll('*', '•').replaceAll('<>', '⬦');

  static String normalizeTitle(String s) {
    List<String> titles = s.split('/');
    String frontTitle = titles[0].trim();
    String backTitle = titles.length > 1 ? titles[1].trim() : '';
    String vSuffix = backTitle.endsWith('(V)') ? ' (V)' : '';

    return (frontTitle + vSuffix).replaceAll('•', '').replaceAll('<>', '');
  }

  static List<String> castListString(dynamic data) =>
      (data ?? []).map<String>((e) => e.toString()).toList() as List<String>;

  static List<SwCard> listFromJson(List list) {
    return list.map((cardMap) => SwCard.fromJson(cardMap)).toList();
  }

  static String comparisonTitle(String title) {
    return title.toLowerCase();
  }
}
