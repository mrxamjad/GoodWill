import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container paymentTransferCard(
    {String amount = "0",
    bool isRecharge = false,
    String paymentStatus = "pending",
    String pMethod = "PayTM",
    String pAccount = "XXXXXXXX253",
    String TID = "1212154134412",
    String date = "24-Sep-2023"}) {
  Color pColor = Colors.white;
  if (paymentStatus == "pending" || paymentStatus == "Pending")
    pColor = Colors.orange[400]!;
  if (paymentStatus == "success" || paymentStatus == "Success")
    pColor = Colors.lightGreen;

  return Container(
    height: 100,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 0.5, color: Colors.teal)),
    child: Column(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      isRecharge ? "By:" : "To:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          pMethod,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )),
                        Expanded(
                            child: Text(
                          pAccount,
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 10),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[50]
                    ),
                    child: Text(
                      "TID: $TID",
                      style: const TextStyle(
                          color: Colors.teal,
                          fontSize: 8,
                        fontStyle: FontStyle.italic
                          ),
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(" Amount: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontStyle: FontStyle.normal)),
                      Text(
                        " ₹ $amount",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                      color: pColor, borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    paymentStatus,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ))
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: TextStyle(color: Colors.grey[600], fontSize: 10),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
