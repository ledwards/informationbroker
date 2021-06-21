import 'package:flutter/material.dart';
import 'package:informationbroker/models/SwCard.dart';

class CardModal extends StatefulWidget {
  CardModal({Key? key, required this.card}) : super(key: key);
  final SwCard card;

  @override
  State<CardModal> createState() => _CardModalState();
}

class _CardModalState extends State<CardModal> {
  String? currentSideImageUrl;

  @override
  Widget build(BuildContext context) {
    if (currentSideImageUrl == null) {
      currentSideImageUrl = widget.card.imageUrl;
    }

    return GestureDetector(
      onTap: () {
        if (widget.card.backImageUrl != null) {
          toggleImage();
        }
      },
      child: Center(
        child: Image(
          image: NetworkImage(currentSideImageUrl!),
        ),
      ),
    );
  }

  toggleImage() {
    String flippedSideImageUrl;
    if (currentSideImageUrl == widget.card.imageUrl) {
      flippedSideImageUrl = widget.card.backImageUrl!;
    } else {
      flippedSideImageUrl = widget.card.imageUrl;
    }

    setState(() {
      currentSideImageUrl = flippedSideImageUrl;
    });
  }
}
