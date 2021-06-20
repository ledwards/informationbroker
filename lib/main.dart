import 'package:flutter/material.dart';
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
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SwCard> allCards = [];

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
      allCards = results[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loaded this many cards:',
            ),
            Text(
              allCards.length.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
