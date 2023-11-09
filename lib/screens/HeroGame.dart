import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/FirebaseKey.dart';
import '../firebase/FirebaseService.dart';
import '../methods/changeMatchId.dart';
import '../methods/firstLatterCapital.dart';
import '../methods/toDigit.dart';
import '../widget/gameNameSlogan.dart';
import '../widget/jionGameDialog.dart';
import '../widget/rowHeading.dart';
import '../widget/timerUI.dart';
import '../widget/winnerList.dart';

class HeroGame extends StatefulWidget {
  const HeroGame({Key? key}) : super(key: key);

  @override
  State<HeroGame> createState() => _HeroGameState();
}

class _HeroGameState extends State<HeroGame> {
  StreamController secondController = StreamController();
  StreamController minuteController = StreamController();
  StreamController allowButtonController = StreamController();

  late Stream allowButtonStream;

  Timer? timer;
  String startDate = "";
  int remainTime = 0;
  bool allowButton = true;
  String matchId = "";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    allowButtonStream = allowButtonController.stream.asBroadcastStream();
  }

  @override
  void dispose() {
    allowButtonController.close();
    secondController.close();
    minuteController.close();

    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Card(
              color: Colors.teal[100],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(80))),
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(80),
                              bottomLeft: Radius.circular(80),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: StreamBuilder(
                                        stream: FirebaseService.currentMatchRef
                                            .doc("hero")
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            var data = snapshot.data;
                                            matchId = data![FirebaseKey.duoId]
                                                .toString();
                                            var part = data[FirebaseKey.duoId]
                                                .toString()
                                                .substring(2);
                                            return Text("ID: H$part",
                                                style: const TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8));
                                          } else {
                                            return const Text("ID: --:--",
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8));
                                          }
                                        })),
                                const Icon(
                                  Icons.flag,
                                  color: Colors.teal,
                                  size: 32,
                                ),
                              ],
                            ),
                            gameNameSlogan("HERO", "60:00 Min Match"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                StreamBuilder(
                                    stream: FirebaseService.currentMatchRef
                                        .doc("fizz")
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        var data = snapshot.data;
                                        String time =
                                            data![FirebaseKey.matchStartTime];

                                        startDate = time;
                                        DateTime startTime =
                                            DateTime.parse(time);

                                        var addedTime = startTime
                                            .add(const Duration(seconds: 3600));
                                        int leftTime = addedTime
                                            .difference(DateTime.now())
                                            .inSeconds;

                                        int minute = 0;
                                        int second = 0;

                                        Timer.periodic(
                                            const Duration(seconds: 1),
                                            (timer) {
                                          if (leftTime <= 0) {
                                            timer.cancel();
                                          } else {
                                            leftTime--;
                                            remainTime = leftTime;
                                          }

                                          if (leftTime > 30) {
                                            allowButton = true;
                                          } else {
                                            allowButton = false;
                                          }

                                          minute = leftTime ~/ 60;
                                          second = leftTime % 60;

                                          secondController.sink.add(second);
                                          minuteController.sink.add(minute);
                                          allowButtonController.sink
                                              .add(allowButton);
                                        });
                                        return Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.teal,
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
                                                  color: Colors.teal,
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
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    }),
                              ],
                            )
                          ],
                        ),
                      )),
                  StreamBuilder(
                      stream: allowButtonStream,
                      builder: (context, snapshot) {
                        return Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              margin: const EdgeInsets.all(1),
                              elevation: 1,
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(80))),
                              child: Column(
                                children: [
                                  Card(
                                    color: Colors.teal[100],
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 45, vertical: 1),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: const Text(
                                        "Duo",
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 18),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          height: 50,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          80)))),
                                              onPressed: allowButton
                                                  ? () {
                                                      joinGameDialog(
                                                          context,
                                                          "red",
                                                          changeMatchIdType(
                                                              matchId, "D"),
                                                          startDate,
                                                          remainTime);
                                                    }
                                                  : null,
                                              child: const Text(
                                                "Red",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          height: 50,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      80)))),
                                              onPressed: allowButton
                                                  ? () {
                                                      joinGameDialog(
                                                          context,
                                                          "green",
                                                          changeMatchIdType(
                                                              matchId, "D"),
                                                          startDate,
                                                          remainTime);
                                                    }
                                                  : null,
                                              child: const Text(
                                                "Green",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  StreamBuilder(
                      stream: allowButtonStream,
                      builder: (context, snapshot) {
                        return Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              margin: const EdgeInsets.all(1),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Card(
                                    color: Colors.teal[100],
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 45, vertical: 1),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: const Text(
                                        "Trio",
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 18),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          height: 50,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.pink,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        80),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        80))),
                                              ),
                                              onPressed: allowButton
                                                  ? () {
                                                      joinGameDialog(
                                                          context,
                                                          "pink",
                                                          changeMatchIdType(
                                                              matchId, "T"),
                                                          startDate,
                                                          remainTime);
                                                    }
                                                  : null,
                                              child: const Text(
                                                "Pink",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          height: 50,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.blue),
                                              onPressed: allowButton
                                                  ? () {
                                                      joinGameDialog(
                                                          context,
                                                          "blue",
                                                          changeMatchIdType(
                                                              matchId, "T"),
                                                          startDate,
                                                          remainTime);
                                                    }
                                                  : null,
                                              child: const Text("Blue",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white))),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          height: 50,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.purple,
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(80),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      80)))),
                                              onPressed: allowButton
                                                  ? () {
                                                      joinGameDialog(
                                                          context,
                                                          "purple",
                                                          changeMatchIdType(
                                                              matchId, "T"),
                                                          startDate,
                                                          remainTime);
                                                    }
                                                  : null,
                                              child: const Text("Purple",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white))),
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  StreamBuilder(
                      stream: allowButtonStream,
                      builder: (context, snapshot) {
                        return Expanded(
                          flex: 3,
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              margin: const EdgeInsets.all(1),
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(80),
                                      bottomRight: Radius.circular(30))),
                              child: Column(
                                children: [
                                  Card(
                                    color: Colors.teal[100],
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 45, vertical: 1),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: const Text(
                                        "Neo",
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 18),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),

                                                // height: 70,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.red,
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            30)))),
                                                    onPressed: allowButton
                                                        ? () {
                                                            joinGameDialog(
                                                                context,
                                                                "1",
                                                                changeMatchIdType(
                                                                    matchId,
                                                                    "N"),
                                                                startDate,
                                                                remainTime);
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "1",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                // height: 70,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.green),
                                                    onPressed: allowButton
                                                        ? () {
                                                            joinGameDialog(
                                                                context,
                                                                "2",
                                                                changeMatchIdType(
                                                                    matchId,
                                                                    "N"),
                                                                startDate,
                                                                remainTime);
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "2",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                // height: 70,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.purple),
                                                    onPressed: allowButton
                                                        ? () {
                                                            joinGameDialog(
                                                                context,
                                                                "3",
                                                                changeMatchIdType(
                                                                    matchId,
                                                                    "N"),
                                                                startDate,
                                                                remainTime);
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "3",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                // height: 70,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.blue,
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            30)))),
                                                    onPressed: allowButton
                                                        ? () {
                                                            joinGameDialog(
                                                                context,
                                                                "4",
                                                                changeMatchIdType(
                                                                    matchId,
                                                                    "N"),
                                                                startDate,
                                                                remainTime);
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "4",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                // height: 70,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.teal,
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            30)))),
                                                    onPressed: allowButton
                                                        ? () {
                                                            joinGameDialog(
                                                                context,
                                                                "8",
                                                                changeMatchIdType(
                                                                    matchId,
                                                                    "N"),
                                                                startDate,
                                                                remainTime);
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "8",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                // height: 70,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.brown),
                                                    onPressed: allowButton
                                                        ? () {
                                                            joinGameDialog(
                                                                context,
                                                                "7",
                                                                changeMatchIdType(
                                                                    matchId,
                                                                    "N"),
                                                                startDate,
                                                                remainTime);
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "7",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                // height: 70,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.pink),
                                                    onPressed: allowButton
                                                        ? () {
                                                            joinGameDialog(
                                                                context,
                                                                "6",
                                                                changeMatchIdType(
                                                                    matchId,
                                                                    "N"),
                                                                startDate,
                                                                remainTime);
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "6",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                // height: 70,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.amber,
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            30)))),
                                                    onPressed: allowButton
                                                        ? () {
                                                            joinGameDialog(
                                                                context,
                                                                "5",
                                                                changeMatchIdType(
                                                                    matchId,
                                                                    "N"),
                                                                startDate,
                                                                remainTime);
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "5",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.teal[100]!,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(80), topLeft: Radius.circular(80))),
          child: Column(
            children: [
              // headingType("Novel Winner List"),
              gameNameSlogan("HERO", " The Winner List"),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rowHeading("ID", flex: 2),
                    rowHeading("Match"),
                    rowHeading("Winner"),
                  ],
                ),
              ),
              SizedBox(
                height: 350,
                child: FutureBuilder(
                    future: FirebaseService.heroMatchHistory(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        List matchList = [];

                        data!.docs.map((e) => matchList.add(e.data())).toList();
                        if (matchList.isNotEmpty) {
                          return ListView.builder(
                            padding: const EdgeInsets.only(top: 5),
                            itemCount: matchList.length,
                            itemBuilder: (context, index) {
                              return winnerList(
                                  id: matchList[index][FirebaseKey.matchId],
                                  matchType: capitalizeWord(
                                      matchList[index][FirebaseKey.matchType]),
                                  winner: matchList[index]
                                              [FirebaseKey.matchWinner] ==
                                          ""
                                      ? "--:--"
                                      : capitalizeWord(matchList[index]
                                          [FirebaseKey.matchWinner]));
                            },
                          );
                        } else {
                          return const Center(
                            child: Text(
                              "No match history",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return const Text("--: Error :--");
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
