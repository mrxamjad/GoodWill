import 'package:flutter/material.dart';
import 'package:good_will/widget/jionGameDialog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/gameNameSlogan.dart';
import '../widget/rowHeading.dart';
import '../widget/timerUI.dart';
import '../widget/winnerList.dart';

class NovelGame extends StatefulWidget {
  const NovelGame({Key? key}) : super(key: key);

  @override
  State<NovelGame> createState() => _NovelGameState();
}

class _NovelGameState extends State<NovelGame> {
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Text("ID: N202309251301",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8)),
                                ),
                                Icon(
                                  Icons.flag,
                                  color: Colors.teal,
                                  size: 32,
                                ),
                              ],
                            ),
                            gameNameSlogan("NOVEL", "2:30 Min Match"),
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
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                          child: Text(
                                        "01",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      )),
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
                                      child: const Center(
                                          child: Text(
                                        "22",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
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
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.all(2),
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(80)))),
                                        onPressed: () {
                                          joinGameDialog(context);

                                        },
                                        child: const Text("Red")),
                                  )),
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.all(2),
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(80)))),
                                        onPressed: () {},
                                        child: const Text("Green")),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.all(2),
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pink,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(80),
                                                  bottomLeft:
                                                      Radius.circular(80))),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Pink",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  )),
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.all(2),
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue),
                                        onPressed: () {},
                                        child: const Text("Blue",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ))),
                                  )),
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.all(2),
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.purple,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(80),
                                                    bottomRight:
                                                        Radius.circular(80)))),
                                        onPressed: () {},
                                        child: const Text("Purple",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ))),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),

                                          // height: 70,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          30)))),
                                              onPressed: () {},
                                              child: const Text(
                                                "1",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          // height: 70,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.green),
                                              onPressed: () {},
                                              child: const Text(
                                                "2",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          // height: 70,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.purple),
                                              onPressed: () {},
                                              child: const Text(
                                                "3",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          // height: 70,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.blue,
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      30)))),
                                              onPressed: () {},
                                              child: const Text(
                                                "4",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                          padding: const EdgeInsets.all(2),
                                          // height: 70,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.teal,
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      30)))),
                                              onPressed: () {},
                                              child: const Text(
                                                "8",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          // height: 70,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.brown),
                                              onPressed: () {},
                                              child: const Text(
                                                "7",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          // height: 70,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.pink),
                                              onPressed: () {},
                                              child: const Text(
                                                "6",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.all(2),
                                          // height: 70,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.amber,
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      30)))),
                                              onPressed: () {},
                                              child: const Text(
                                                "5",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                  ),
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
              gameNameSlogan("NOVEL", " The Winner List"),
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
                    rowHeading("Duo"),
                    rowHeading("Trio"),
                    rowHeading("Neo"),
                    rowHeading("Winner"),
                  ],
                ),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 5),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return winnerList(id: "N202309261800");
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
