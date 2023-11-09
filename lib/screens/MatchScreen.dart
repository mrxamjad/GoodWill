import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../Constants/FirebaseKey.dart';
import '../data/Data.dart';
import '../firebase/FirebaseService.dart';
import '../widget/matchList.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  String matchName = "";
  bool won = false;
  String date = "";
  String time = "";
  String dateTime = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            "Games History",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.teal[100]),
                child: matchList(
                    match: "Match",
                    process: "Process",
                    status: "Status",
                    totalWinner: "Amount",
                    amountBgColor: Colors.teal,
                    amountTextColor: Colors.white,
                    idBgColor: Colors.teal,
                    idTextColor: Colors.white,
                    id: "Match ID"),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: FirebaseService.userRef
                          .doc(DataClass.userKey)
                          .collection(FirebaseKey.matchDetails)
                          .orderBy(FirebaseKey.matchStartTime, descending: true)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("-- Error --"),
                          );
                        }
                        if (snapshot.hasData) {
                          List dataList = [];
                          snapshot.data!.docs.map((e) {
                            dataList.add(e.data());
                          }).toList();
                          if (dataList.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child: ListView.builder(
                                itemCount: dataList.length,
                                itemBuilder: (context, index) {
                                  date = DateFormat.MMMMd().format(
                                      DateTime.parse(dataList[index]
                                          [FirebaseKey.matchStartTime]));

                                  time = DateFormat.jm().format(DateTime.parse(
                                      dataList[index]
                                          [FirebaseKey.matchStartTime]));
                                  dateTime = "$time, $date";

                                  if (dataList[index]
                                          [FirebaseKey.matchWinner] ==
                                      dataList[index]
                                          [FirebaseKey.selectedItem]) {
                                    won = true;
                                  }

                                  String matchNameLatter = dataList[index]
                                          [FirebaseKey.matchId]
                                      .toString()
                                      .substring(0, 1)
                                      .toUpperCase();
                                  if (matchNameLatter == "N") {
                                    matchName = "NOVEL";
                                  }
                                  if (matchNameLatter == "E") {
                                    matchName = "ELITE";
                                  }
                                  if (matchNameLatter == "F") {
                                    matchName = "FIZZ";
                                  }
                                  if (matchNameLatter == "H") {
                                    matchName = "HERO";
                                  }

                                  return matchList(
                                      id: dataList[index][FirebaseKey.matchId],
                                      process: dataList[index]
                                                  [FirebaseKey.matchStatus] ==
                                              FirebaseKey.matchInProcess
                                          ? "inProcess"
                                          : "Finished",
                                      status: (dataList[index][FirebaseKey
                                                      .matchStatus] ==
                                                  FirebaseKey.matchInProcess) &&
                                              !won
                                          ? "--:--"
                                          : won
                                              ? "Won"
                                              : "Lose",
                                      totalWinner:
                                          "₹ ${dataList[index][FirebaseKey.amount]}",
                                      match: matchName,
                                      showDate: true,
                                      date: dateTime);
                                },
                              ),
                            );
                          } else {
                            return const Center(
                                child: Text(
                              "No match history!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ));
                          }
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.teal,
                          ));
                        }
                      })),
            ],
          ),
        ));
  }
}
