import 'package:flutter/material.dart';
import 'package:good_will/screens/WithdrawTab.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdrawal History"),
        centerTitle: true,
      ),
      body: const WithdrawTab(),
    );
  }
}
