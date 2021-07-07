import 'package:flutter/material.dart';

class ThumbButton extends StatelessWidget {
  final icon;
  final color;
  final count;
  final size;
  final onPressed;

  ThumbButton(
      {this.icon, this.size = 35.0, this.count, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: size, color: color),
          ),
        ),
        Text('$count')
      ],
    );
  }
}
