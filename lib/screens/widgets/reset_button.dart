import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final text;
  final icon;
  final backgroundColor;
  final foregroundColor;
  final onPressed;

  ResetButton(
      {this.text = 'Reset',
      this.icon,
      this.backgroundColor = Colors.red,
      this.foregroundColor = Colors.yellow,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        label: Text(text),
        icon: icon,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        heroTag: null,
      ),
    );
  }
}
