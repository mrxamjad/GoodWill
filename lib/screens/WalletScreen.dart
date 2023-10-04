import 'package:flutter/material.dart';
import 'package:good_will/screens/PendingWithdrawalTab.dart';
import 'package:good_will/screens/RechargeTab.dart';
import 'package:good_will/screens/WithdrawTab.dart';
import 'package:good_will/widget/diplayAmount.dart';
import 'package:good_will/widget/pageBackground.dart';
import 'package:good_will/widget/rechargeWidget.dart';
import 'package:good_will/widget/withdrawalWidget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool recharge = false;
  bool withdraw=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageBackground(
              fistBoxColor: Colors.teal[200]!,
              secondBoxColor: Colors.grey[200]!),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                  child: SizedBox(
                    height: 230,
                    width: double.infinity,
                    child: Card(
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
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
                                                  backgroundColor: Colors.red),
                                              onPressed: () {
                                                setState(() {
                                                  recharge = !recharge;
                                                  withdraw=false;
                                                });
                                              },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  displayAmount(
                                      title: "Today Winning",
                                      amount: "1000",
                                      amountBgColor: Colors.green,
                                      amountColor: Colors.white),
                                  displayAmount(
                                      title: "Total Winning", amount: "3000"),
                                  displayAmount(
                                      title: "Withdraw Pending",
                                      amount: "1000",
                                      amountColor: Colors.white,
                                      amountBgColor: Colors.amber),
                                ],
                              )
                            ],

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only( topRight: Radius.circular(30),topLeft: Radius.circular(30),)
                                  )
                                ),
                                  onPressed: (){
                                  setState(() {
                                    withdraw=!withdraw;
                                    recharge=false;
                                  });
                                  }, child: Text("Withdraw")),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (recharge)  
                  Stack(
                    children: [
                      RechargeWiget(
                ),
                      Positioned(
                        top: 20,
                          right: 40,
                          child: IconButton(
                          onPressed: (){
                            recharge=!recharge;

                            setState(() {

                            });
                          }

                          ,
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          )))
                    ],
                  ),
                if (withdraw)
                  Stack(
                    children: [
                      withdrawalWidget(
                      ),
                      Positioned(
                          top: 20,
                          right: 40,
                          child: IconButton(
                              onPressed: (){
                                withdraw=!withdraw;

                                setState(() {

                                });
                              }

                              ,
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.red,
                              )))
                    ],
                  ),
                SizedBox(
                  height: 600,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.teal[100],
                        // foregroundColor: Colors.teal,

                        toolbarHeight: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        flexibleSpace: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TabBar(
                              labelColor: Colors.white,
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              unselectedLabelStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                              unselectedLabelColor: Colors.teal,
                              indicatorColor: Colors.white,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: const EdgeInsets.all(6),
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      20), // Creates border
                                  color: Colors.teal),
                              tabs: const [
                                Tab(
                                    child: Text(
                                  'Withdraw',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                Tab(
                                    child: Text('Recharge',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Tab(
                                    child: Text('Pending',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ],
                            )
                          ],
                        ),
                      ),
                      body: const TabBarView(
                        children: [
                          WithdrawTab(),
                          RechargeTab(),
                          PendingWithdrawalTab(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
