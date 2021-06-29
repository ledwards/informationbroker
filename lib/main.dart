import 'package:flutter/material.dart';
import 'package:informationbroker/models/FilterSet.dart';
import 'package:provider/provider.dart';
import 'package:informationbroker/widgets/CardsListWidget.dart';
import 'package:informationbroker/widgets/FilterButton.dart';
import 'package:informationbroker/widgets/SearchWidget.dart';
import 'package:informationbroker/models/SwCard.dart';
import 'package:informationbroker/models/SwCardsList.dart';
import 'package:informationbroker/models/FilterSet.dart';
import 'package:informationbroker/utils/Loader.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SwCardsList()),
        ChangeNotifierProvider(create: (_) => FilterSet()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Information Broker',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<SwCard>? _cardPool; // TODO: default to empty
  List<SwCard>? _currentCards;
  FilterSet get _filterSet => Provider.of<FilterSet>(context, listen: false);

  @override
  void initState() {
    _setup();
    super.initState();
  }

  _setup() async {
    Loader loader = Loader(context);
    List<SwCard> loadedCards;

    List results = await Future.wait([loader.cards()]).then((res) {
      loadedCards = res[0];

      return [
        loadedCards,
      ];
    });

    _filterSet.addListener(() {
      setState(() {
        _currentCards = _filterSet.cards;
      });
    });

    setState(() {
      _cardPool = results[0];
      _filterSet.cardPool = _cardPool!;
      _currentCards = List<SwCard>.from(_cardPool!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information Broker"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilterButton(),
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          (_currentCards) == null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Loading..."),
                )
              : SearchWidget(
                  _currentCards!,
                ),
          (_currentCards) == null
              ? Text("")
              : Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                      "Showing ${(_currentCards ?? []).length} cards"), // TODO: Move this out of search widget!
                ),
          (_currentCards ?? []).isEmpty
              ? Text("")
              : CardsListWidget(cards: _currentCards!),
        ]),
      ),
    );
  }
}
