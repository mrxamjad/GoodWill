import 'package:flutter/material.dart';
import 'package:good_will/screens/PendingWithdrawalTab.dart';

class PendingWithdrawalScreen extends StatelessWidget {
  const PendingWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Pending Withdrawal",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: PendingWithdrawalTab(),
    );
  }
}
