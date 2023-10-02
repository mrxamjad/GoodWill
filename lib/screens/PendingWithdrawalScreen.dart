import 'package:flutter/material.dart';
import 'package:good_will/screens/PendingWithdrawalTab.dart';

class PendingWithdrawalScreen extends StatelessWidget {
  const PendingWithdrawalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Withdrawal"),
        centerTitle: true,
      ),
      body: PendingWithdrawalTab(),
    );
  }
}
