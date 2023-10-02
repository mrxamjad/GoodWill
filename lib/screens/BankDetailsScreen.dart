import 'package:flutter/material.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    upiId = "7260004480@paytm";
    ifscCode = "SBIN0002905";
    bankName = "STATE BANK OF INDIA";
    accountNumber = "36270887631";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Bank Details"),
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 80,
                                            child: Text(
                                              "A/C Number",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          child: Text(
                                            ":  $accountNumber",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 80,
                                            child: Text(
                                              "IFSC Code",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          child: Text(
                                            ":  $ifscCode",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 80,
                                            child: Text(
                                              "Bank Name",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          child: Text(
                                            ":  ${bankName.toUpperCase()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 80,
                                            child: Text(
                                              "UPI ID ",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          child: Text(
                                            ":  $upiId",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
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
                Container(
                  child: Column(
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
                                child: const Text("ADD UPI"),
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
                                child: const Text("ADD BANK A/C"),
                              ),
                            ),
                          ],
                        ),
                      if (!upi && bank)
                        Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.teal, width: 0.5),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                    setState(() {
                                      upiId = upiIdCont.text;
                                      upi = true;
                                    });
                                  },
                                  child: const Text("Add UPI"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                    setState(() {
                                      accountNumber = accountNumberCont.text;
                                      ifscCode = ifscCont.text;
                                      bankName = bankNameCont.text;
                                      bank = true;
                                    });
                                  },
                                  child: const Text("ADD BANK"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
