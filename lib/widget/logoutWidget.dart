import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:good_will/screens/LoginScreen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../backend/SharedPref.dart';

TextButton logoutWidget(BuildContext context) {
  return TextButton(
      onPressed: () async {
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
                        backgroundColor: Colors.red,
                          radius:45,
                          child: Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
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
                                    "Are you sure want to logout?",
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
                                            backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30))),
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: Text("No")),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30))),
                                          onPressed: () async {
                                            await FirebaseAuth.instance.signOut();
                                            var s = await SharedPref.getUser();
                                            if (kDebugMode) {
                                              print("Before Logout: $s");
                                            }
                                            await SharedPref.setUser("");
                                            s = await SharedPref.getUser();
                                            if (kDebugMode) {
                                              print("After Logout: $s");
                                            }
                                            context.nextAndRemoveUntilPage(
                                                LoginScreen());
                                          },
                                          child: Text("Logout")),
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
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: const [
            Icon(Icons.logout, color: Colors.teal,),
            Text(
              " Logout",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ],
        ),
      ));
}
