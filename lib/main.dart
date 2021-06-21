import 'package:flutter/material.dart';
import 'package:informationbroker/widgets/CardTableWidget.dart';
import 'package:informationbroker/widgets/SearchWidget.dart';
import 'models/SwCard.dart';
import 'utils/Loader.dart';

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
  List<SwCard> cardPool = [];
  List<SwCard> cards = [];

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
      cardPool = results[0];
      cards = List<SwCard>.from(cardPool);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilding main');
    return Scaffold(
      appBar: AppBar(
        title: Text("Information Broker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SearchWidget(
                cardPool: cardPool,
                onSearch: (List<SwCard> foundCards) {
                  setState(() {
                    cards = foundCards;
                  });
                }),
            CardTableWidget(cards: cards),
          ],
        ),
      ),
    );
  }
}
