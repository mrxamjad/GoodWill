import 'package:flutter/material.dart';
import 'package:good_will/widget/pageBackground.dart';

import '../widget/paymentTransferCard.dart';

class RechargeTab extends StatelessWidget {
  const RechargeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          pageBackground(fistBoxColor: Colors.teal, secondBoxColor: Colors.grey[200]!),
          const Center(child: Text("No Recharge History Found!", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.teal),)),
          SizedBox(
            height: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return paymentTransferCard(isRecharge: true, paymentStatus: "Pending" ,amount: "1000");
              },
            ),
          )
        ],
      ),
    );
  }
}
