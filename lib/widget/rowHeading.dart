import 'package:flutter/material.dart';

Expanded rowHeading(
  String name, {
  int flex = 1,
  double fontSize = 14,
  Color bgColor = Colors.teal,
  Color textColor = Colors.white,
}) {
  return Expanded(
      flex: flex,
      child: Container(
          // height: 30,
          padding: const EdgeInsets.symmetric(
              // horizontal: 5,
              vertical: 5),
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            name,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize),
          ))));
}
