import 'package:flutter/material.dart';

class LevelStars extends StatelessWidget {
  const LevelStars({this.level});

  final double level;

  @override
  Widget build(BuildContext context) {
    final starsItem = <Widget>[];
    for (var i = 0; i < level; i++) {
      starsItem.add(const Icon(Icons.star, color: Colors.orange));
    }
    for (var i = 0; i < 5 - level; i++) {
      starsItem.add(const Icon(Icons.star_border, color: Colors.orange));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starsItem,
    );
  }
}
