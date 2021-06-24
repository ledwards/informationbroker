import 'package:flutter/material.dart';
import 'package:informationbroker/models/SwCard.dart';
import 'package:informationbroker/widgets/CardModal.dart';

class CardTableWidget extends StatefulWidget {
  CardTableWidget({Key? key, required this.cards}) : super(key: key);
  final List<SwCard> cards;

  @override
  State<CardTableWidget> createState() => _CardTableWidgetState();
}

class _CardTableWidgetState extends State<CardTableWidget> {
  late List<SwCard> _cards;

  void initState() {
    _cards = widget.cards;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: _cards.length,
        itemBuilder: (BuildContext context, int index) {
          SwCard card = _cards[index];
          Color textColor =
              (card.side == 'Dark' ? Colors.white70 : Colors.black87);

          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: CardModal(card: card),
                    );
                  });
            },
            child: Container(
              height: 65,
              margin: const EdgeInsets.all(1.0),
              padding: const EdgeInsets.all(1.0),
              color: card.side == 'Dark' ? Colors.black45 : Colors.white54,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image(
                    image: NetworkImage(card.imageUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.displayTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                      Text(
                        card.displayType,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      Text(
                        card.set,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
