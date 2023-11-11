import 'package:flutter/material.dart';
import 'package:good_will/screens/WithdrawTab.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Withdrawal History",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const WithdrawTab(),
    );
  }
}
