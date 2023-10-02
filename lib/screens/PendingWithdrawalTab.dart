import 'package:flutter/material.dart';

import '../widget/pageBackground.dart';
import '../widget/paymentTransferCard.dart';

class PendingWithdrawalTab extends StatelessWidget {
  const PendingWithdrawalTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          pageBackground(fistBoxColor: Colors.teal, secondBoxColor: Colors.grey[200]!),
          const Center(child: Text("No Pending Transaction found!", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.teal),)),
          SizedBox(
            height: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return paymentTransferCard( paymentStatus: "Pending" ,amount: "1000");
              },
            ),
          )
        ],
      ),
    );
  }
}
