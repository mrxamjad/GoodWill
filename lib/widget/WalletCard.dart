
import 'package:flutter/material.dart';

import 'diplayAmount.dart';

Padding WalletCard({
  required String availableBalence,
  required String todayWinnig,
  required String totalWinning,
  required String withdrawPending,
  double topMargin=70
}){
  return Padding(
    padding:  EdgeInsets.only(top: topMargin, left: 30, right: 30),
    child: SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        color: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Available Balance".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                         Text(
                          " ₹ $availableBalence ",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: 90,
                            height: 20,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {},
                                child: const Text(
                                  "RECHARGE",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white),
                                )))
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    displayAmount(
                        title: "Today Winning",
                        amount: todayWinnig,
                        amountBgColor: Colors.green,
                        amountColor: Colors.white),
                    displayAmount(
                        title: "Total Winning", amount: totalWinning),
                    displayAmount(
                        title: "Withdraw Pending",
                        amount: withdrawPending,
                        amountColor: Colors.white,
                        amountBgColor: Colors.red),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}