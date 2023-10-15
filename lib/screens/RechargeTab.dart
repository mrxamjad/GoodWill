import 'package:flutter/material.dart';
import 'package:good_will/widget/pageBackground.dart';
import 'package:intl/intl.dart';

import '../Constants/FirebaseKey.dart';
import '../data/Data.dart';
import '../firebase/FirebaseService.dart';
import '../widget/paymentTransferCard.dart';

class RechargeTab extends StatelessWidget {
  const RechargeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          pageBackground(fistBoxColor: Colors.teal, secondBoxColor: Colors.grey[200]!),
          SizedBox(
            height: double.infinity,
            child:  Padding(
              padding: const EdgeInsets.only(bottom: 110),
              child: FutureBuilder(
                  future: FirebaseService.userRef.doc(DataClass.userKey).collection(FirebaseKey.rechargeDetails).get(),
                  builder: (context, snapshot) {
                    if( snapshot.hasError){
                      return const Center( child: Text("-- Error --"),);
                    }
                    if(snapshot.hasData){
                      List dataList= [];
                      snapshot.data!.docs.map((e) {

                        dataList.add(e.data());

                      }
                      )
                          .toList();
                      if(dataList.isNotEmpty) {

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: ListView.builder(
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              String date=DateFormat.MMMMd().format(DateTime.parse(dataList[index][FirebaseKey.rechargeRequestTime]));
                              String time=DateFormat.jm().format(DateTime.parse(dataList[index][FirebaseKey.rechargeRequestTime]));
                              String dateTime= time+", "+date;


                              return paymentTransferCard(
                                isRecharge: true,
                                pMethod: dataList[index][FirebaseKey.paymentMethod],
                                pAccount: dataList[index][FirebaseKey.bankAccount],
                                paymentStatus: dataList[index][FirebaseKey.rechargeStatus],
                                amount: dataList[index][FirebaseKey.rechargeAmount].toString(),
                                TID: dataList[index][FirebaseKey.rechargeId],
                                date: dateTime,
                              );
                            },
                          ),
                        );
                      }
                      else{
                        return const Center(
                            child: Text(
                              "No recharge history!",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                            ));
                      }
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
                    }


                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
