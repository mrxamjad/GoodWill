import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../methods/firstLatterCapital.dart';

void customToast(BuildContext context, String theme, String msg) {
  Color? bgColor = Colors.red[100];
  Color borderColor = Colors.red;
  IconData icon = Icons.cancel_rounded;

  if (theme == "success") {
    bgColor = Colors.green[100];
    borderColor = Colors.green;
    icon = Icons.check_circle_outline_rounded;
  }
  if (theme == "error") {
    bgColor = Colors.red[100];
    borderColor = Colors.red;
    icon = Icons.warning_rounded;
  }
  if (theme == "warning") {
    bgColor = Colors.amber[100];
    borderColor = Colors.amber;
    icon = Icons.error_outline_rounded;
  }
  // ScaffoldMessenger.of(context).sh

  FToast fToast = FToast();
  fToast.init(context);

  Widget widget = Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor)),
    child: Row(
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
  );
  fToast.showToast(
      child: widget,
      toastDuration: Duration(seconds: 3),
      gravity: ToastGravity.TOP);
}
