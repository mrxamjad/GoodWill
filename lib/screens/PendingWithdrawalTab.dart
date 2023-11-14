import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/FirebaseKey.dart';
import '../data/Data.dart';
import '../firebase/FirebaseService.dart';
import '../widget/pageBackground.dart';
import '../widget/paymentTransferCard.dart';

class PendingWithdrawalTab extends StatelessWidget {
  const PendingWithdrawalTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageBackground(
              fistBoxColor: Colors.teal, secondBoxColor: Colors.grey[200]!),
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: SizedBox(
              height: double.infinity,
              child: FutureBuilder(
                  future: FirebaseService.userRef
                      .doc(DataClass.userKey)
                      .collection(FirebaseKey.withdrawDetails)
                      .where(FirebaseKey.withdrawStatus, isEqualTo: "pending")
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
                              String date = DateFormat.MMMMd().format(
                                  DateTime.parse(dataList[index]
                                      [FirebaseKey.withdrawRequestTime]));
                              String time = DateFormat.jm().format(
                                  DateTime.parse(dataList[index]
                                      [FirebaseKey.withdrawRequestTime]));
                              String dateTime = time + ", " + date;

                              return paymentTransferCard(
                                pMethod: dataList[index]
                                    [FirebaseKey.paymentMethod],
                                pAccount: dataList[index]
                                    [FirebaseKey.bankAccount],
                                paymentStatus: dataList[index]
                                    [FirebaseKey.withdrawStatus],
                                amount: dataList[index]
                                    [FirebaseKey.withdrawAmount],
                                TID: dataList[index][FirebaseKey.withdrawId],
                                date: dateTime,
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                            child: Text(
                          "No withdrawal history!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.teal),
                        ));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
