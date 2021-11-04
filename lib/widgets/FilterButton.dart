import 'package:flutter/material.dart';
import 'package:informationbroker/models/SwCard.dart';
import 'package:informationbroker/widgets/FilterForm.dart';

class FilterButton extends StatefulWidget {
  FilterButton({Key? key, required this.cardPool}) : super(key: key);

  final List<SwCard> cardPool;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  IconData filterIcon = Icons.filter_alt_outlined;

  List<SwCard> get _cardPool => widget.cardPool;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          filterIcon = Icons.filter_alt;
        });
      },
      onTapUp: (_) {
        setState(() {
          filterIcon = Icons.filter_alt_outlined;
        });
      },
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: FilterForm(cardPool: _cardPool),
              );
            });
      },
      child: Icon(filterIcon),
    );
  }
}
