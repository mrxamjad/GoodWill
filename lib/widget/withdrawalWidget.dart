import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class withdrawalWidget extends StatefulWidget {
  const withdrawalWidget({Key? key}) : super(key: key);

  @override
  State<withdrawalWidget> createState() => _withdrawalWidgetState();
}

class _withdrawalWidgetState extends State<withdrawalWidget> {

  TextEditingController amountController = TextEditingController();
  int amount=0;
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

            child: Text(
              "Withdraw Details",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
          ),
          Divider( color: Colors.teal,thickness: 1,),

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
                      // controller: amountController,
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
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {


                });
              },
              child: const Text("Withdraw"),
            ),
          ),
        ],
      ),
    );
  }
}
