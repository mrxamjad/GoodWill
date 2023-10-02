

import 'package:flutter/material.dart';

Expanded displayAmount( { String title="title", String amount="0", Color bgColor=Colors.transparent,Color titleColor=Colors.white,Color amountColor=Colors.teal,Color amountBgColor=Colors.white, }){
  return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
               style:  TextStyle(
                  color: titleColor,

                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 5, vertical: 3),
                margin: const EdgeInsets.symmetric(
                    horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: amountBgColor,
                ),
                child: Center(
                    child: Text(
                      "₹ $amount",
                      style:  TextStyle(
                        color: amountColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ))),
          ],
        ),
      ));
}