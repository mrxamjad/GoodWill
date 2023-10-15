// ignore: file_names
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:good_will/Constants/DataKey.dart';
import 'package:good_will/Constants/FirebaseKey.dart';
import 'package:good_will/firebase/FirebaseService.dart';
import 'package:good_will/screens/HeroGame.dart';
import 'package:good_will/widget/pageBackground.dart';
import 'package:good_will/widget/rechargeWidget.dart';

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
  String userKey = DataClass.userKey;

  //set User id to data class
  getKey() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userKey = (pref.getString(DataKey.userId))!;
    DataClass.userKey = userKey;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

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
                    child: StreamBuilder(
                        stream: FirebaseService.userRef
                            .doc(userKey)
                            .collection(FirebaseKey.profile)
                            .doc(FirebaseKey.profileId)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Could'n fetch data"),
                            );
                          } else if (snapshot.hasData) {
                            var data = snapshot.data;
                            if (data!.exists) {
                              DataClass.availableBalance =
                                  data[FirebaseKey.availableBalance];

                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: Colors.teal,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            data[FirebaseKey.name]
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 2.0),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "User Id : ".toUpperCase(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              data[FirebaseKey.userId],
                                              style: const TextStyle(
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                width: 1, color: Colors.white)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Available Balance"
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                " ₹ ${data[FirebaseKey.availableBalance]} ",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                  width: 90,
                                                  height: 20,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.red),
                                                      onPressed: () {
                                                        setState(() {
                                                          recharge = !recharge;
                                                        });
                                                      },
                                                      child: const Text(
                                                        "RECHARGE",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white),
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
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 18,
                                                                vertical: 0),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: data[FirebaseKey
                                                                            .lastMatchStatus] ==
                                                                        "won"
                                                                    ? Colors
                                                                        .green
                                                                    : data[FirebaseKey.lastMatchStatus] ==
                                                                            "lost"
                                                                        ? Colors
                                                                            .red
                                                                        : Colors
                                                                            .purple,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                        child: Text(
                                                          data[FirebaseKey
                                                              .lastMatchStatus],
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
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
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 18,
                                                                vertical: 0),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Text(
                                                          "₹ ${data[FirebaseKey.totalWinning]} ",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.teal,
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 22,
                                                                vertical: 0),
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Text(
                                                          data[FirebaseKey
                                                                  .currentMatch]
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                              );
                            } else {
                              return const Center(
                                child: Text("Wallet not exist"),
                              );
                            }
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
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
                              onPressed: () {
                                recharge = !recharge;
                                setState(() {});
                              },
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
