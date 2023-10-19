import 'package:flutter/material.dart';

import '../methods/firstLatterCapital.dart';

void customSnackbar(BuildContext context, String theme, String msg) {
  Color? bgColor = Colors.red[50];
  Color borderColor = Colors.red;
  IconData icon = Icons.cancel_rounded;

  if (theme == "success") {
    bgColor = Colors.green[50];
    borderColor = Colors.green;
    icon = Icons.check_circle_outline_rounded;
  }
  if (theme == "error") {
    bgColor = Colors.red[50];
    borderColor = Colors.red;
    icon = Icons.warning_rounded;
  }
  if (theme == "warning") {
    bgColor = Colors.amber[50];
    borderColor = Colors.amber;
    icon = Icons.error_outline_rounded;
  }
  // theme
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    backgroundColor: bgColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: borderColor)),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            icon,
            color: borderColor,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Text(
                  "${capitalizeWord(theme)}: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: borderColor),
                ),
                Expanded(child: Text(msg, style: TextStyle(color: borderColor)))
              ],
            ),
          ),
        ),
        Icon(
          Icons.cancel_sharp,
          color: borderColor,
        )
      ],
    ),
  ));
}
