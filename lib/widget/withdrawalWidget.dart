import 'package:flutter/material.dart';
import 'package:good_will/Constants/FirebaseKey.dart';
import 'package:good_will/data/Data.dart';
import 'package:good_will/firebase/FirebaseService.dart';
import 'package:velocity_x/velocity_x.dart';

class withdrawalWidget extends StatefulWidget {
  const withdrawalWidget({Key? key}) : super(key: key);

  @override
  State<withdrawalWidget> createState() => _withdrawalWidgetState();
}

class _withdrawalWidgetState extends State<withdrawalWidget> {

  TextEditingController amountController = TextEditingController();
  int amount=0;
  int selectedValue=0;
  String bankAccount="", paymentMethod="", ifsc="", bankName="", upi="";
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),

            child: const Text(
              "Withdraw Details",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
          ),
          const Divider( color: Colors.teal,thickness: 1,),

          Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: 150,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 18),
                        hintStyle:
                        TextStyle(color: Colors.grey[400], fontSize: 32),
                        hintText: "₹",
                        label: Text(
                          "Rs.",
                          style:
                          TextStyle(color: Colors.teal[200], fontSize: 32),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2)),
                      ),
                      onChanged: (value) {
                        try {
                          if (value.isNotEmptyAndNotNull) {

                            setState(() {
                              amount = int.parse(value);

                            });
                          } else {
                            setState(() {
                              amount=0;
                            });
                          }
                        } catch (e) {
                          setState(() {
                            // multiple = 0;
                          });
                          context.showToast(
                              msg: "Wrong value ",
                              bgColor: Colors.red,
                              textColor: Colors.white,
                              position: VxToastPosition.center);
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
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "₹ $amount",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )
          ]),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Colors.teal
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Transfer to :'
                    , style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly
                  ,
                  children: [
                  FutureBuilder(
                      future: FirebaseService.userRef.doc(DataClass.userKey).collection(FirebaseKey.paymentDetails).doc(FirebaseKey.bankDetails).get(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          var data= snapshot.data;
                          if(data!.exists){
                            bankAccount=data[FirebaseKey.bankAccount];
                            bankName=data[FirebaseKey.bankName];
                            ifsc=data[FirebaseKey.ifscCode];

                            return Row(
                              children: [
                                Radio(
                                  value: 1,
                                  activeColor: Colors.teal,
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value!;
                                      print("Seleceted value:$selectedValue");
                                    });
                                  },
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Bank Account',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${data[FirebaseKey.bankName]}',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 6),
                                    ),Text(
                                      '${data[FirebaseKey.bankAccount]}',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 6),
                                    ),
                                  ],
                                )
                              ],
                            );

                          }else{
                            return const Center( child: Text("-- Bank --"),);


                          }
                        }
                        else if( snapshot.hasError){
                          const Center( child: Text("-- Error --"),);
                        }
                        else{
                          return const Center( child: CircularProgressIndicator(),);
                        }
                        return const Center( child: Text( "-- Bank --"),);
                      }
                  ),
                FutureBuilder(
                  future: FirebaseService.userRef.doc(DataClass.userKey).collection(FirebaseKey.paymentDetails).doc(FirebaseKey.upiDetails).get(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      var data= snapshot.data;
                      if(data!.exists){
                        upi=data[FirebaseKey.upiId];
                         return Row(
                          children: [
                            Radio(
                              value: 2,
                              activeColor: Colors.teal,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                  print("Seleceted value:$selectedValue");
                                });
                              },
                            ),
                            Column(
                              children: [
                                const Text(
                                  'UPI Account',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${data[FirebaseKey.upiId]}',
                                  style: TextStyle( color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        );

                      }else{
                        return const Center( child: Text("--UPI --"),);


                      }
                    }
                    else if( snapshot.hasError){
                      const Center( child: Text("-- Error --"),);
                    }
                    else{
                      return const Center( child: CircularProgressIndicator(),);
                    }
                    return const Center( child: Text( "-- UPI --"),);
                  }
                ),
          ],),
              ],
            ),

          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                if(selectedValue!=0){
                  if(amount is int) {
                    if (amount >= 10) {
                      if (selectedValue == 1) {
                        paymentMethod = "Bank Account";
                      }
                      else {

                        paymentMethod = "UPI id";
                        bankAccount=upi;
                      }
                      int availableBalance=await FirebaseService.userRef.doc(DataClass.userKey).collection(FirebaseKey.profile).doc(FirebaseKey.profileId).get().then((value) => value.data()![FirebaseKey.availableBalance]);
                      int balance= availableBalance;
                      if( amount<=balance){
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: SizedBox(
                                height: 200,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Positioned(
                                        right: 90,

                                        top: -60,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 50,
                                          child: CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              radius:45,
                                              child: Text("Alert !", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.teal, width: 1)),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Expanded(
                                              child: Padding(
                                                padding:
                                                EdgeInsets.only(top: 25, left: 25, right: 25),
                                                child: Center(
                                                  child: Text(
                                                    "Are you sure want to withdraw?",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor: Colors.red,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(30))),
                                                          onPressed: () {
                                                            context.pop();
                                                          },
                                                          child: const Text("No")),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor: Colors.green,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(30))),
                                                          onPressed: () async {
                                                            FirebaseService.addWithdrawHistory(
                                                                DataClass.userKey, amountController.text,
                                                                paymentMethod, bankAccount, bankName, ifsc);
                                                            FirebaseService.updateWithdraw(DataClass.userKey, amount);
                                                            amountController.clear();
                                                            // amountController.text="0";
                                                            amount = 0;
                                                            setState(() {

                                                            });
                                                            context.showToast(msg: "Request submitted successfully", textColor: Colors.white, bgColor: Colors.green, position: VxToastPosition.top);
                                                            context.pop();


                                                          },
                                                          child: const Text("Withdraw")),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      else{
                        context.showToast(msg: "Insufficiant balance..", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);


                      }

                    }else{
                      context.showToast(msg: "Enter amount at least 10 and more..", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);


                    }

                  }

                  else{
                    context.showToast(msg: "Enter a valid amount", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);
                  }

                }else{
                  context.showToast(msg: "Please add a payment method..", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);


                }





              },
              child: const Text("Withdraw"),
            ),
          ),
        ],
      ),
    );
  }
}
