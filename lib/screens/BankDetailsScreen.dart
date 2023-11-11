import 'package:flutter/material.dart';
import 'package:good_will/Constants/FirebaseKey.dart';
import 'package:good_will/data/Data.dart';
import 'package:good_will/firebase/FirebaseService.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/pageBackground.dart';

class BankDetailScreen extends StatefulWidget {
  BankDetailScreen({Key? key}) : super(key: key);

  @override
  State<BankDetailScreen> createState() => _BankDetailScreenState();
}

class _BankDetailScreenState extends State<BankDetailScreen> {
  bool bank = true, upi = true;

  TextEditingController accountNumberCont = TextEditingController();
  TextEditingController confirmAccountNumberCont = TextEditingController();

  TextEditingController ifscCont = TextEditingController();

  TextEditingController bankNameCont = TextEditingController();
  TextEditingController upiIdCont = TextEditingController();
  String upiId = "", ifscCode = "", bankName = "", accountNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Bank Details",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          pageBackground(
              fistBoxColor: Colors.teal[200]!,
              secondBoxColor: Colors.grey[200]!),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              const BorderSide(width: 0.5, color: Colors.teal)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.teal, width: 0.5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Bank Details",
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  FutureBuilder(
                                      future: FirebaseService.userRef
                                          .doc(DataClass.userKey)
                                          .collection(
                                              FirebaseKey.paymentDetails)
                                          .doc(FirebaseKey.bankDetails)
                                          .get(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return const Center(
                                            child: Text("Error found!"),
                                          );
                                        } else if (snapshot.hasData) {
                                          if (snapshot.data!.exists) {
                                            var data = snapshot.data;
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                          width: 80,
                                                          child: Text(
                                                            "A/C Number",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[800],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Expanded(
                                                        child: Text(
                                                          ":  ${data![FirebaseKey.bankAccount]}",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                          width: 80,
                                                          child: Text(
                                                            "IFSC Code",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[800],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Expanded(
                                                        child: Text(
                                                          ":  ${data[FirebaseKey.ifscCode].toString().toUpperCase()}",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                          width: 80,
                                                          child: Text(
                                                            "Bank Name",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[800],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Expanded(
                                                        child: Text(
                                                          ":  ${data[FirebaseKey.bankName].toUpperCase()}",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          } else {
                                            return Center(
                                              child: Text(
                                                "No record found.",
                                                style: TextStyle(
                                                    color: Colors.grey[600]),
                                              ),
                                            );
                                          }
                                        } else {
                                          return const Center(
                                            child: SizedBox(
                                              height: 20,
                                              width: 20,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }
                                      }),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.teal, width: 0.5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "UPI Details",
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  FutureBuilder(
                                      future: FirebaseService.userRef
                                          .doc(DataClass.userKey)
                                          .collection(
                                              FirebaseKey.paymentDetails)
                                          .doc(FirebaseKey.upiDetails)
                                          .get(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return const Center(
                                            child: Text("Error found!"),
                                          );
                                        } else if (snapshot.hasData) {
                                          if (snapshot.data!.exists) {
                                            var data = snapshot.data;
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: 80,
                                                      child: Text(
                                                        "UPI ID ",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[800],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  Expanded(
                                                    child: Text(
                                                      ":  ${data![FirebaseKey.upiId]}",
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Center(
                                              child: Text(
                                                "No record found.",
                                                style: TextStyle(
                                                    color: Colors.grey[600]),
                                              ),
                                            );
                                          }
                                        } else {
                                          return const Center(
                                            child: SizedBox(
                                              height: 20,
                                              width: 20,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }
                                      }),
                                ],
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Note: ",
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                    child: Text(
                                  "If you want to change any details or add new account, Just add by clicking below.",
                                  style: TextStyle(
                                      color: Colors.teal, fontSize: 8),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    if (upi && bank)
                      Column(
                        children: [
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal),
                              onPressed: () {
                                setState(() {
                                  upi = false;
                                });
                              },
                              child: const Text(
                                "ADD UPI",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const Text(
                            "or",
                            style: TextStyle(
                                color: Colors.teal,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal),
                              onPressed: () {
                                setState(() {
                                  bank = false;
                                });
                              },
                              child: const Text(
                                "ADD BANK A/C",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!upi && bank)
                      Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal, width: 0.5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "UPI Details",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          upi = true;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: upiIdCont,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,

                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  labelText: "UPI ID",

                                  // hintText: "Enter your name",
                                  hintStyle: TextStyle(color: Colors.teal),
                                  labelStyle: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal),
                                onPressed: () {
                                  //update firebase with upi id

                                  if (!upiIdCont.text.isEmptyOrNull) {
                                    if (upiIdCont.text.contains("@")) {
                                      FirebaseService.addUPI(
                                              DataClass.userKey, upiIdCont.text)
                                          .whenComplete(() {
                                        context.showToast(
                                            msg: "UPI ID successfully updated.",
                                            textColor: Colors.white,
                                            bgColor: Colors.green,
                                            position: VxToastPosition.top);
                                        upiIdCont.clear();
                                        setState(() {
                                          upi = true;
                                        });
                                      });
                                    } else {
                                      context.showToast(
                                          msg: "Wrong UPI ID, Please check..",
                                          textColor: Colors.white,
                                          bgColor: Colors.red,
                                          position: VxToastPosition.top);
                                    }
                                  } else {
                                    context.showToast(
                                        msg: "Please enter UPI ID!",
                                        textColor: Colors.white,
                                        bgColor: Colors.red,
                                        position: VxToastPosition.top);
                                  }
                                },
                                child: const Text(
                                  "Add UPI",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (upi && !bank)
                      Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Bank Details",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          bank = true;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: accountNumberCont,
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                obscuringCharacter: "*",
                                // controller: _nameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  labelText: "A/C Number",
                                  labelStyle: TextStyle(color: Colors.teal),
                                ),
                                onChanged: (value) {
                                  try {} catch (e) {
                                    context.showToast(
                                        msg: "A/C No. only can have number!",
                                        textColor: Colors.white,
                                        bgColor: Colors.red,
                                        position: VxToastPosition.top);
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: confirmAccountNumberCont,
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  labelText: "Confirm A/C Number",
                                  labelStyle: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: ifscCont,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  labelText: "IFSC Code",
                                  labelStyle: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: bankNameCont,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 0.5)),
                                  labelText: "Bank Name",
                                  labelStyle: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal),
                                onPressed: () {
                                  try {
                                    if (!bankNameCont.text.isEmptyOrNull &&
                                        !accountNumberCont.text.isEmptyOrNull &&
                                        !ifscCont.text.isEmptyOrNull) {
                                      if (accountNumberCont.text ==
                                          confirmAccountNumberCont.text) {
                                        FirebaseService.addBank(
                                                DataClass.userKey,
                                                bankNameCont.text.toUpperCase(),
                                                ifscCont.text.toUpperCase(),
                                                accountNumberCont.text)
                                            .whenComplete(() {
                                          context.showToast(
                                              msg:
                                                  "Bank details successfully updated.",
                                              textColor: Colors.white,
                                              bgColor: Colors.green,
                                              position: VxToastPosition.top);
                                          upiIdCont.clear();
                                          setState(() {
                                            bank = true;
                                          });
                                        });
                                      } else {
                                        context.showToast(
                                            msg:
                                                "Account number is mismatched !",
                                            textColor: Colors.white,
                                            bgColor: Colors.red,
                                            position: VxToastPosition.top);
                                      }
                                    } else {
                                      context.showToast(
                                          msg: "Invalid details is entered.",
                                          textColor: Colors.white,
                                          bgColor: Colors.red,
                                          position: VxToastPosition.top);
                                    }
                                  } catch (e) {
                                    context.showToast(
                                        msg: "A/C No. only can have number!",
                                        textColor: Colors.white,
                                        bgColor: Colors.red,
                                        position: VxToastPosition.top);
                                  }
                                },
                                child: const Text(
                                  "ADD BANK",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Note: ",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold)),
                          Expanded(
                              child: Text(
                            "We never colllect your Bank or UPI data for other use or third party use, its just collected so that we can transfer your fund later on.",
                            style: TextStyle(color: Colors.teal, fontSize: 8),
                          )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
