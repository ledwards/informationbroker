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
  String? destiny;
  String? deploy;
  String? forfeit;
  String? power;
  String? ability;
  String? manuever;
  String? armor;
  String? landspeed;
  String? hyperspeed;

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
        destiny = json['front']['destiny'],
        deploy = json['front']['deploy'],
        forfeit = json['front']['forfeit'],
        power = json['front']['power'],
        ability = json['front']['ability'],
        manuever = json['front']['maneuver'],
        armor = json['front']['armor'],
        landspeed = json['front']['landspeed'],
        hyperspeed = json['front']['hyperspeed'],
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

  static List<String> allTypes(List<SwCard> cards) {
    var types = cards.map((e) => e.type).toSet().toList();
    types.sort();
    return types;
  }

  static List<String> allSubTypes(List<SwCard> cards) {
    var subTypes = cards
        .map((e) => e.subType ?? "")
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();
    subTypes.sort();
    return subTypes;
  }

  // TODO: Should just operate on current subset of cards?
  // Make a list of cards local to the form as we build
  static List<String> allSubTypesFor(String type, List<SwCard> cards) {
    var subTypes = cards
        .map((e) => e.type == type ? (e.subType ?? "") : "")
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();
    subTypes.sort();
    return subTypes;
  }

  static List<String> allSubTypeClasses(List<SwCard> cards) {
    var subTypes = SwCard.allSubTypes(cards);
    var subTypeClasses = subTypes
        .map((e) {
          return (e.contains(":") || e.contains("/") || e.contains(" Or "))
              ? e.split(":")[0].split("/")[0].split(" Or ")[0]
              : "";
        })
        .toSet()
        .toList();
    subTypeClasses.sort();
    return subTypeClasses;
  }

  static List<String> allSubTypeClassesFor(List<String> subTypes) {
    var subTypeClasses =
        subTypes.map((e) => e.split(":")[0].split("/")[0]).toSet().toList();
    subTypeClasses.sort();
    return subTypeClasses;
  }

  static List<String> allSets(List<SwCard> cards) {
    var sets = cards.map((e) => e.set).toSet().toList();
    sets.sort();
    return sets;
  }

  static List<String> allIcons(List<SwCard> cards) {
    var icons = cards.expand((el) => el.icons).toSet().toList();
    icons.sort();
    return icons;
  }

  static List<String> allDestinies(List<SwCard> cards) {
    var destinies = cards
        .map((e) => e.destiny ?? "")
        .where((e) => e != "")
        .toSet()
        .toList();
    destinies.sort();
    return destinies;
  }

  static List<String> allDeploys(List<SwCard> cards) {
    var deploys =
        cards.map((e) => e.deploy ?? "").where((e) => e != "").toSet().toList();
    deploys.sort();
    return deploys;
  }

  static List<String> allForfeits(List<SwCard> cards) {
    var forfeits = cards
        .map((e) => e.forfeit ?? "")
        .where((e) => e != "")
        .toSet()
        .toList();
    forfeits.sort();
    return forfeits;
  }

  static List<String> allPowers(List<SwCard> cards) {
    var powers =
        cards.map((e) => e.power ?? "").where((e) => e != "").toSet().toList();
    powers.sort();
    return powers;
  }

  static List<String> allAbilities(List<SwCard> cards) {
    var abilities = cards
        .map((e) => e.ability ?? "")
        .where((e) => e != "")
        .toSet()
        .toList();
    abilities.sort();
    return abilities;
  }

  static List<String> allManeuvers(List<SwCard> cards) {
    var manuevers = cards
        .map((e) => e.manuever ?? "")
        .where((e) => e != "")
        .toSet()
        .toList();
    manuevers.sort();
    return manuevers;
  }

  static List<String> allArmors(List<SwCard> cards) {
    var armors =
        cards.map((e) => e.armor ?? "").where((e) => e != "").toSet().toList();
    armors.sort();
    return armors;
  }
}
