import 'package:flutter/material.dart';
import 'package:informationbroker/widgets/CardTableWidget.dart';
import 'package:informationbroker/widgets/FilterButton.dart';
import 'package:informationbroker/widgets/SearchWidget.dart';
import 'package:informationbroker/models/SwCard.dart';
import 'package:informationbroker/utils/Loader.dart';

void main() {
  runApp(MyApp());
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
  List<SwCard>? _cardPool;
  List<SwCard>? _cards;

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

    setState(() {
      _cardPool = results[0];
      _cards = List<SwCard>.from(_cardPool ?? []);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (_cardPool ?? []).isEmpty
              ? [
                  Text("Loading..."),
                ]
              : <Widget>[
                  SearchWidget(
                      cardPool: _cardPool ?? [],
                      onSearch: (List<SwCard> foundCards) {
                        setState(() {
                          _cards = List<SwCard>.from(foundCards);
                        });
                      }),
                  CardTableWidget(cards: _cards ?? []),
                ],
        ),
      ),
    );
  }
}
