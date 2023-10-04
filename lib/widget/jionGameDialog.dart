
import 'package:flutter/material.dart';
import 'package:good_will/backend/getColorByName.dart';
import 'package:good_will/widget/gameNameSlogan.dart';
import 'package:velocity_x/velocity_x.dart';

joinGameDialog( BuildContext context){
   showDialog(context: context, builder:
   (context) {



     return Dialog(
       child: SizedBox(
           height:600,
           child: JoinGameWidget())
     );
   },);
}


class JoinGameWidget extends StatefulWidget {
  const JoinGameWidget({Key? key}) : super(key: key);

  @override
  State<JoinGameWidget> createState() => _JoinGameWidgetState();
}

class _JoinGameWidgetState extends State<JoinGameWidget> {
  int selectedOption = 10;
  int multiple = 0;
  TextEditingController amountMultiple = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          // const SizedBox(
          //   height: 50,
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Padding(
          //       padding: EdgeInsets.only(left: 20),
          //       child: Text(
          //         "Game Details",
          //         style: TextStyle(
          //             color: Colors.teal,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 26),
          //       ),
          //     ),
          //   ),
          // ),
          gameNameSlogan("NOVA","2:30 min Match"),
          Container(
            margin: const EdgeInsets.only( left: 20, top: 10, bottom: 5, right: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.teal)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 54,
                        child: Text("ID", style: TextStyle( color:  Colors.teal,fontWeight:  FontWeight.bold),)),
                    Text(":  25487456254",style:  TextStyle( color:  Colors.teal,),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                        width: 54,
                        child: Text("TYPE", style: TextStyle( color:  Colors.teal,fontWeight:  FontWeight.bold),)),
                    Text(":  TRIO",style:  TextStyle( color:  Colors.teal,),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(
                        width: 60,
                        child: Text("CHOICE :", style: TextStyle( color:  Colors.teal,fontWeight:  FontWeight.bold),)),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                      decoration: BoxDecoration(
                          color: getColorByName("Red"),
                        borderRadius: BorderRadius.circular(20)

                      ),
                        child: Text("RED",style:  TextStyle( color:  Colors.white,),))
                  ],
                )
              ],

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all( width: 1, color: Colors.teal),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(

                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '₹10',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
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

                        ],
                      ),
                    ),
                    Container(

                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all( width: 1, color: Colors.teal),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '₹100',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
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

                        ],
                      ),
                    ),
                    Container(

                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all( width: 1, color: Colors.teal),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '₹1000',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
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

                        ],
                      ),
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
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                setState(() {
                  // DataClass.addRecharge(selectedOption * multiple);
                  // amountMultiple.clear();
                  // multiple=0;

                });
              },
              child: const Text("Join"),
            ),
          ),
        ],
      ),
    );
  }
}
