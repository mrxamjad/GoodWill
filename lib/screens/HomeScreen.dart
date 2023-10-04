import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:good_will/backend/SharedPref.dart';
import 'package:good_will/screens/HeroGame.dart';
import 'package:good_will/screens/LoginScreen.dart';
import 'package:good_will/widget/pageBackground.dart';
import 'package:good_will/widget/rechargeWidget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data/Data.dart';
import 'EliteGame.dart';
import 'FizzGame.dart';
import 'NovelGame.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool recharge = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: pageBackground(
                  fistBoxColor: Colors.teal[100]!,
                  secondBoxColor: Colors.grey[300]!)),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),

                  /// Balance Card Design
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.teal,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Amjad Ali".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "User Id : ".toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "7260002280",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
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
                                    Text(
                                      " ₹ ${DataClass.availableBalance} ",
                                      style: const TextStyle(
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
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: SizedBox(
                                height: 21,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Last Match",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 0),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: const Text(
                                                "Lose",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Total Winning",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 0),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: const Text(
                                                "₹ 10000 ",
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Current Match",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 22,
                                                      vertical: 0),
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: const Text(
                                                "2",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                if (recharge)
                  Stack(
                    children: [
                      RechargeWiget(),
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

                /// Game Play Design
                SizedBox(
                  height: 900,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      List<Widget> list = [
                        const NovelGame(),
                        const FizzGame(),
                        const EliteGame(),
                        const HeroGame()
                      ];
                      return list[index];
                    },
                    itemCount: 4,
                    pagination: const SwiperPagination(),
                    control: const SwiperControl(),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
