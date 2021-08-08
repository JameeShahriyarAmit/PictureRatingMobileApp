import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final max;
  final stars;
  final size;
  final color;

  Rating(
      {this.stars = 0,
      this.max = 5,
      this.size = 20.0,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    final icons = <IconData>[];

    for (int i = 0; i < stars; i++) {
      icons.add(Icons.star);
    }

    for (int i = stars + 1; i <= max; i++) {
      icons.add(Icons.star_border);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: icons
          .map((icon) => Icon(
                icon,
                color: color,
                size: size,
              ))
          .toList(),
    );
  }
}
