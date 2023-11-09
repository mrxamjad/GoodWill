import 'package:flutter/material.dart';
import 'package:good_will/backend/getColorByName.dart';
import 'package:good_will/widget/rowHeading.dart';

Container matchList(
    {String id = "--",
    String match = "--",
    String date = "--:--",
    bool showDate = false,
    String process = "--",
    String status = "--",
    String totalWinner = "--",
    Color idTextColor = Colors.teal,
    Color idBgColor = Colors.white,
    Color amountBgColor = Colors.white,
    Color amountTextColor = Colors.teal}) {
  return Container(
    // height: 80,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: Colors.teal)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rowHeading(id,
                flex: 2,
                textColor: idTextColor,
                bgColor: idBgColor,
                fontSize: 10),
            rowHeading(match, bgColor: Colors.teal, fontSize: 11),
            rowHeading(process, bgColor: getColorByName(process), fontSize: 11),
            // if(process=="Finished")
            rowHeading(status, bgColor: getColorByName(status), fontSize: 11),
            rowHeading("$totalWinner",
                textColor: amountTextColor,
                bgColor: amountBgColor,
                fontSize: 12),
          ],
        ),
        if (showDate)
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 2, right: 5),
                child: Text(
                  date,
                  style: TextStyle(color: Colors.grey[800], fontSize: 8),
                ),
              ))
      ],
    ),
  );
}
