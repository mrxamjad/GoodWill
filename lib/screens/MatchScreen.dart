import 'package:flutter/material.dart';
import 'package:good_will/widget/winnerList.dart';

import '../widget/matchList.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Games"),
        centerTitle: true
        ,

      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            matchList(

              match: "Match",
              process: "Process",
              status: "Status",
                totalWinner: "Amount"),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                return matchList(id: "H20230926235523");
              },),
            ),
          ],
        ),
      )
    );
  }
}
