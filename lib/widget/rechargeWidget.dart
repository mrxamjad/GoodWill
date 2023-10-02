import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:good_will/data/Data.dart';
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
  TextEditingController amountMultiple = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                "Recharge Details",
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
                        recharge = false;
                      });
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    )),
              ),
            ],
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
                              print("Seleceted value:$selectedOption");
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
                              print("Seleceted value:$selectedOption");
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
                              print("Seleceted value:$selectedOption");
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
                  const Padding(
                    padding:
                        EdgeInsets.only(bottom: 15, left: 8, right: 8, top: 8),
                    child: Text(
                      "Enter Amount",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                      controller: amountMultiple,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 18),
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
                setState(() {
                  DataClass.addRecharge(selectedOption * multiple);
                });
              },
              child: const Text("Recharge"),
            ),
          ),
        ],
      ),
    );
  }
}
