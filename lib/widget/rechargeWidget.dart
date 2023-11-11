// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:good_will/data/Data.dart';
import 'package:good_will/firebase/FirebaseService.dart';

import 'package:good_will/widget/customToast.dart';
import 'package:quantupi/quantupi.dart';
import 'package:velocity_x/velocity_x.dart';

class RechargeWiget extends StatefulWidget {
  const RechargeWiget({super.key});

  @override
  State<RechargeWiget> createState() => _RechargeWigetState();
}

class _RechargeWigetState extends State<RechargeWiget> {
  bool recharge = false;
  int selectedOption = 10;
  int multiple = 0;
  String status = "";
  TextEditingController amountMultiple = TextEditingController();

  String appname = paymentappoptions[0];

// method to initiate payment
  Future<String> initiateTransaction({QuantUPIPaymentApps? app}) async {
    Quantupi upi = Quantupi(
      // 7321079853359@ybl'
      //saifali73210@okaxis
      //8001430576@fbpe
      receiverUpiId: 'paytmqr17921z88hj@paytm',
      receiverName: 'GoodWill',
      transactionRefId: '251254235',
      transactionNote: 'note: recharge will be credited shortly',
      amount: 1.0,
      appname: app,
    );
    String response = await upi.startTransaction();

    return response;
  }

  @override
  Widget build(BuildContext context) {
    // bool isios = !kIsWeb && Platform.isIOS;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    const Text(
                      "Recharge Details",
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                    Text(status)
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.teal, width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Select multiple of amount",
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                          value: 10,
                          activeColor: Colors.teal,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        const Text(
                          '₹10',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 100,
                          activeColor: Colors.teal,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        const Text(
                          '₹100',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1000,
                          activeColor: Colors.teal,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        const Text(
                          '₹1000',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: 100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                      controller: amountMultiple,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(fontSize: 18),
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 8),
                        hintText: "Amount X ₹$selectedOption",
                        label: Text(
                          " Amount ",
                          style:
                              TextStyle(color: Colors.teal[200], fontSize: 16),
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
                            multiple = int.parse(value);
                            setState(() {
                              multiple = int.parse(value);
                            });
                          } else {
                            setState(() {
                              multiple = 0;
                            });
                          }
                        } catch (e) {
                          setState(() {
                            multiple = 0;
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
              "₹ ${selectedOption * multiple}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )
          ]),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                try {
                  if (selectedOption * multiple >= 10) {
                    // context.nextPage(QuantUpiScreen());
                    setState(() async {
                      const platform =
                          MethodChannel('com.sabpaisa.integration/native');
                      final List<Object?> result =
                          await platform.invokeMethod('callSabPaisaSdk', [
                        (DataClass.name),
                        "",
                        (DataClass.email),
                        (DataClass.phone),
                        "${selectedOption * multiple}"
                      ]);

                      String txnStatus = result[0].toString();
                      String txnId = result[1].toString();

                      // ignore: use_build_context_synchronously
                      customToast(
                          context,
                          txnStatus == "SUCCESS" ? "success" : "error",
                          txnStatus == "SUCCESS"
                              ? "Recharge sucessfully done"
                              : "Recharge Failed!");

                      if (txnStatus == "SUCCESS") {
                        await FirebaseService.addRechargeHistory(
                            DataClass.userKey,
                            txnId,
                            selectedOption * multiple,
                            "Payment Gatway",
                            "",
                            "",
                            "");
                      }
                      setState(() {});

                      amountMultiple.clear();
                      multiple = 0;
                    });
                  } else {
                    customToast(context, "error", 'Amount should atleast 10!!');
                  }
                } catch (r) {
                  // context.showToast(
                  //     msg: "Please enter a valid amount",
                  //     bgColor: Colors.red,
                  //     position: VxToastPosition.top,
                  //     textColor: Colors.white);
                }
              },
              child: const Text(
                "Recharge",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  QuantUPIPaymentApps appoptiontoenum(String appname) {
    switch (appname) {
      case 'Amazon Pay':
        return QuantUPIPaymentApps.amazonpay;
      case 'BHIMUPI':
        return QuantUPIPaymentApps.bhimupi;
      case 'Google Pay':
        return QuantUPIPaymentApps.googlepay;
      case 'Mi Pay':
        return QuantUPIPaymentApps.mipay;
      case 'Mobikwik':
        return QuantUPIPaymentApps.mobikwik;
      case 'Airtel Thanks':
        return QuantUPIPaymentApps.myairtelupi;
      case 'Paytm':
        return QuantUPIPaymentApps.paytm;

      case 'PhonePe':
        return QuantUPIPaymentApps.phonepe;
      case 'SBI PAY':
        return QuantUPIPaymentApps.sbiupi;
      default:
        return QuantUPIPaymentApps.googlepay;
    }
  }
}

const List<String> paymentappoptions = [
  'Amazon Pay',
  'BHIMUPI',
  'Google Pay',
  'Mi Pay',
  'Mobikwik',
  'Airtel Thanks',
  'Paytm',
  'PhonePe',
  'SBI PAY',
];
