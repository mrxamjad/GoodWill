import 'package:flutter/material.dart';
import 'package:good_will/widget/diplayAmount.dart';
import 'package:good_will/widget/pageBackground.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          pageBackground( fistBoxColor: Colors.teal[200]!, secondBoxColor: Colors.grey[200]!),

          Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Card(
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
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
                                const Text(
                                  " ₹ 5000 ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                    width: 90,
                                    height: 20,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            Colors.red),
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
                          children:  [
                           displayAmount(title: "Today Winning", amount: "1000", amountBgColor: Colors.green, amountColor: Colors.white),
                            displayAmount(title: "Total Withdraw", amount: "3000"),
                           displayAmount(title: "Withdraw Pending", amount: "1000", amountColor: Colors.white, amountBgColor: Colors.red),


                          ],
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
          )


        ],

      ),
    );
  }
}
