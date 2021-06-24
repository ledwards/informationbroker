import 'package:flutter/material.dart';
import 'package:informationbroker/widgets/FilterForm.dart';

class FilterButton extends StatefulWidget {
  FilterButton({Key? key}) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  IconData filterIcon = Icons.filter_alt_outlined;

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
                child: FilterForm(onFilter: () => null),
              );
            });
      },
      child: Icon(filterIcon),
    );
  }
}
