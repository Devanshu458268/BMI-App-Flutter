import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {
  final Widget cardChild;
  final Color colour;
  PlaceTile({this.cardChild, this.colour});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colour,
      ),
      margin: EdgeInsets.all(12),
      height: 220,
    );
  }
}
