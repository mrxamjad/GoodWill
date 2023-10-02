import 'package:flutter/material.dart';
import 'package:good_will/widget/paymentTransferCard.dart';

import '../widget/pageBackground.dart';

class WithdrawTab extends StatelessWidget {
  const WithdrawTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageBackground(
              fistBoxColor: Colors.teal,
              secondBoxColor: Colors.grey[200]!),
          const Center(
              child: Text(
            "No Withdrawal History Found!",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
          )),
          SizedBox(
            height: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return paymentTransferCard( paymentStatus: "Success" ,amount: "1000");
              },
            ),
          )
        ],
      ),
    );
  }
}
