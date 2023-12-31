import 'dart:async';

import 'package:flutter/material.dart';
import 'package:good_will/backend/getColorByName.dart';
import 'package:good_will/data/Data.dart';
import 'package:good_will/firebase/FirebaseService.dart';

import 'package:good_will/methods/firstLatterCapital.dart';
import 'package:good_will/widget/gameNameSlogan.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/FirebaseKey.dart';
import '../methods/toDigit.dart';
import 'timerUI.dart';

joinGameDialog(BuildContext context, String selected, String matchId,
    String startTime, int remainTime) {
  showDialog(
    context: context,
    builder: (context) {
      print(selected);
      print(matchId);
      print(startTime);
      print(remainTime);

      StreamController minuteController = StreamController();
      StreamController secondController = StreamController();

      String category = "";
      String matchCode = matchId.substring(0, 1);

      String matchType = "";
      String typeCode = matchId.substring(1, 2);

      // check match category
      if (matchCode == "N") {
        category = "novel";
      }
      if (matchCode == "H") {
        category = "hero";
      }
      if (matchCode == "F") {
        category = "fizz";
      }
      if (matchCode == "E") {
        category = "elite";
      }

      // check match type
      if (typeCode == "N") {
        matchType = "neo";
      }
      if (typeCode == "D") {
        matchType = "duo";
      }
      if (typeCode == "T") {
        matchType = "trio";
      }

      int selectedOption = 10;
      int multiple = 0;
      String timeToShow = "";

      TextEditingController amountMultiple = TextEditingController();

      if (category == "novel") {
        timeToShow = "2:30";
      }
      if (category == "fizz") {
        timeToShow = "5:00";
      }
      if (category == "elite") {
        timeToShow = "15:00";
      }
      if (category == "hero") {
        timeToShow = "60:00";
      }

      return StatefulBuilder(builder: (context, state) {
        int minute = 0, second = 0;
        int availableAmount = 0;

        Timer.periodic(const Duration(seconds: 1), (timer) {
          if (remainTime > 30) {
            remainTime--;
            minute = remainTime ~/ 60;
            second = remainTime % 60;

            secondController.sink.add(second);
            minuteController.sink.add(minute);
          } else {
            if (timer.isActive) {
              timer.cancel();
              Navigator.pop(context);
            }
          }
        });
        return Dialog(
            child: FutureBuilder(
                future: FirebaseService.userRef
                    .doc(DataClass.userKey)
                    .collection(FirebaseKey.currentMatch)
                    .doc(matchId)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return SizedBox(
                        height: 500,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              // border: Border.all(color: Colors.teal),
                              borderRadius: BorderRadius.circular(30)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    gameNameSlogan(category.toUpperCase(),
                                        "$timeToShow min Match"),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              timerUI("C"),
                                              timerUI("O"),
                                              timerUI("U"),
                                              timerUI("N"),
                                              timerUI("T"),
                                              const WidthBox(2),
                                              timerUI("D"),
                                              timerUI("O"),
                                              timerUI("W"),
                                              timerUI("N"),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: StreamBuilder(
                                                      stream: minuteController
                                                          .stream,
                                                      builder:
                                                          (context, spapshot) {
                                                        return Text(
                                                          toDigit(minute),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 22),
                                                        );
                                                      })),
                                            ),
                                            const Text(
                                              ":",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: StreamBuilder(
                                                      stream: secondController
                                                          .stream,
                                                      builder:
                                                          (context, snapshot) {
                                                        return Text(
                                                          toDigit(second),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 22),
                                                        );
                                                      })),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.cancel),
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                                const HeightBox(5),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Available Balance:  ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        FutureBuilder(
                                            future: FirebaseService.userRef
                                                .doc(DataClass.userKey)
                                                .collection(FirebaseKey.profile)
                                                .doc(FirebaseKey.profileId)
                                                .get(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                var data = snapshot.data!;

                                                availableAmount = data[
                                                    FirebaseKey
                                                        .availableBalance];
                                                return Text(
                                                    "₹ $availableAmount",
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold));
                                              } else {
                                                return const Text("--:--");
                                              }
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 5, right: 20),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                          color: Colors.teal, width: 0.3)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                              width: 54,
                                              child: Text(
                                                "ID",
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              )),
                                          Text(
                                            ":  $matchId",
                                            style: const TextStyle(
                                                color: Colors.teal,
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                              width: 54,
                                              child: Text(
                                                "TYPE",
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              )),
                                          Text(
                                            ":   ${capitalizeWord(matchType)}",
                                            style: const TextStyle(
                                                color: Colors.teal,
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                              width: 54,
                                              child: Text(
                                                "CHOICE ",
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              )),
                                          Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 3),
                                              decoration: BoxDecoration(
                                                  color:
                                                      getColorByName(selected),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Text(
                                                capitalizeWord(selected),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 10),
                                      child: Text(
                                        "Select multiple of amount",
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          // height: 76,
                                          margin: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Column(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                  '₹10',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Radio(
                                                value: 10,
                                                activeColor: Colors.teal,
                                                groupValue: selectedOption,
                                                onChanged: (value) {
                                                  state(() {
                                                    selectedOption = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Column(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                  '₹100',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Radio(
                                                value: 100,
                                                activeColor: Colors.teal,
                                                groupValue: selectedOption,
                                                onChanged: (value) {
                                                  state(() {
                                                    selectedOption = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.teal),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Column(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                  '₹1000',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Radio(
                                                value: 1000,
                                                activeColor: Colors.teal,
                                                groupValue: selectedOption,
                                                onChanged: (value) {
                                                  state(() {
                                                    selectedOption = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SizedBox(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: TextField(
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            controller: amountMultiple,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  const TextStyle(fontSize: 18),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 18),
                                              hintText:
                                                  "Amount X ₹$selectedOption",
                                              label: Text(
                                                " Amount ",
                                                style: TextStyle(
                                                    color: Colors.teal[200],
                                                    fontSize: 16),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 2)),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 2)),
                                            ),
                                            onChanged: (value) {
                                              try {
                                                if (value
                                                    .isNotEmptyAndNotNull) {
                                                  multiple = int.parse(value);
                                                  state(() {
                                                    multiple = int.parse(value);
                                                  });
                                                } else {
                                                  state(() {
                                                    multiple = 0;
                                                  });
                                                }
                                              } catch (e) {
                                                state(() {
                                                  multiple = 0;
                                                });
                                                context.showToast(
                                                    msg: "Wrong value ",
                                                    bgColor: Colors.red,
                                                    textColor: Colors.white,
                                                    position:
                                                        VxToastPosition.center);
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(children: [
                                  const Text(
                                    "Total Amount",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "₹ ${selectedOption * multiple}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  )
                                ]),
                                SizedBox(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            getColorByName(selected)),
                                    onPressed: () {
                                      if ((selectedOption * multiple) >= 10 &&
                                          (selectedOption * multiple) <=
                                              availableAmount) {
                                        FirebaseService.joinMatch(
                                            matchId,
                                            selectedOption * multiple,
                                            DataClass.userKey,
                                            selected,
                                            startTime);
                                        context.showToast(
                                            msg: "You have joined successfully",
                                            textColor: Colors.white,
                                            bgColor: Colors.green,
                                            position: VxToastPosition.top);

                                        Navigator.pop(context);
                                      } else {
                                        context.showToast(
                                            msg:
                                                "Please enter a valid amount..",
                                            textColor: Colors.white,
                                            bgColor: Colors.red,
                                            position: VxToastPosition.top);
                                      }
                                    },
                                    child: Text(
                                      "Join ${capitalizeWord(selected)}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }

                  if (snapshot.hasData && snapshot.data!.exists) {
                    return SizedBox(
                      height: 150,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 20),
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     border: Border.all(color: Colors.red, width: 1)),
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(top: 25, left: 25, right: 25),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Congratulation 🎉🎊",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "You have already joined",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                              right: 90,
                              // left: 100,
                              top: -60,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 49,
                                    child: Icon(
                                      Icons.done,
                                      size: 80,
                                      color: Colors.white,
                                    )),
                              )),
                        ],
                      ),
                    );
                  }

                  return const Center(
                    child: SizedBox(
                      height: 50,
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    ),
                  );
                }));
      });
    },
  );
}
