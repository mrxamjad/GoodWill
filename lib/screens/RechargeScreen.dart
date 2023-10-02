import 'package:flutter/material.dart';
import 'package:good_will/screens/RechargeTab.dart';
import 'package:good_will/widget/WalletCard.dart';

import '../widget/pageBackground.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Recharge"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          pageBackground(
              fistBoxColor: Colors.teal[200]!,
              secondBoxColor: Colors.grey[200]!),
          Center(
            child: Column(
              children: [
                WalletCard(availableBalence: "500", todayWinnig: "554", totalWinning: "265", withdrawPending: "254", topMargin: 30),
                Expanded(child: RechargeTab())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
