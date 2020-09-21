import 'package:flutter/material.dart';

class LevelStars extends StatelessWidget {
  const LevelStars({this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    final starsItem = <Widget>[];
    for (var i = 0; i < 5; i++) {
      if (level + i - 5 < 0) {
        starsItem.add(const Icon(Icons.star, color: Colors.grey));
      } else {
        starsItem.add(const Icon(Icons.star, color: Colors.orange));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starsItem,
    );
  }
}
