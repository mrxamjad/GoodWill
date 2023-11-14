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
    int amount = 0,
    String winner = "",
    String selected = "",
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
            rowHeading(process, bgColor: getColorByName(process), fontSize: 8),
            // if(process=="Finished")
            rowHeading(status, bgColor: getColorByName(status), fontSize: 11),
            rowHeading(totalWinner,
                textColor: amountTextColor,
                bgColor: amountBgColor,
                fontSize: 12),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Text(
                    "Selected : ",
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    decoration: BoxDecoration(
                        color: getColorByName(selected),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      selected,
                      style: const TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Winner : ",
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    decoration: BoxDecoration(
                        color: getColorByName(winner),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      winner,
                      style: const TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Price : ",
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "₹ ${amount.toString()}",
                      style: const TextStyle(
                          fontSize: 8,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
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
              )),
      ],
    ),
  );
}
