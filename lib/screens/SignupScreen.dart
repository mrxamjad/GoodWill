import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:good_will/firebase/FirebaseService.dart';
import 'package:good_will/screens/LoginScreen.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              // margin: const EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/signup.png',
                                height: 200,
                                // width: 400,
                              )),
                          const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Create an Account,",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                " Its free",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            makeInput(emailController, label: "Email"),
                            makeInput(phoneController, label: "Phone"),
                            makeInput(passController,
                                label: "Password", obsureText: true),
                            makeInput(confirmPassController,
                                label: "Confirm Pasword", obsureText: true)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: const Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black))),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (passController.text ==
                                    confirmPassController.text) {
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passController.text,
                                    );

                                    String uid = credential.user!.uid;

                                    FirebaseService.createUser(
                                            uid,
                                            emailController.text
                                                .split("@")
                                                .first,
                                            emailController.text,
                                            phoneController.text)
                                        .then((value) {
                                      context.showToast(
                                          msg: "Account Created Successfully",
                                          textColor: Colors.white,
                                          bgColor: Colors.teal,
                                          position: VxToastPosition.center);
                                      Navigator.pop(context);

                                      context.nextAndRemoveUntilPage(
                                          LoginScreen());
                                      emailController.clear();
                                      passController.clear();
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      // ignore: use_build_context_synchronously
                                      context.showToast(
                                          msg:
                                              "The password provided is too weak.",
                                          bgColor: Colors.red,
                                          textColor: Colors.white,
                                          position: VxToastPosition.top);
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      // ignore: use_build_context_synchronously
                                      context.showToast(
                                          msg:
                                              "The account already exists for that email.",
                                          bgColor: Colors.red,
                                          textColor: Colors.white,
                                          position: VxToastPosition.top);
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      context.showToast(
                                          msg: "SingUp Failed!",
                                          bgColor: Colors.red,
                                          textColor: Colors.white,
                                          position: VxToastPosition.top);
                                    }
                                  } catch (e) {
                                    if (kDebugMode) {
                                      print("Error on Loging");
                                    }
                                  }
                                } else {
                                  context.showToast(
                                      msg: "Password mismatch!",
                                      bgColor: Colors.red,
                                      textColor: Colors.white,
                                      position: VxToastPosition.top);
                                }
                              } else {}
                            },
                            color: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]!),
                          ),
                          InkWell(
                            onTap: () =>
                                context.nextAndRemoveUntilPage(LoginScreen()),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.teal,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput(TextEditingController controller,
    {label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.teal),
      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: obsureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal[400]!,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!)),
        ),
        validator: (value) {
          if (label == "Phone" && value!.length < 10) {
            return "phone number is not correct";
          }
          if (value == null || value.isEmpty) {
            return "$label can't be empty";
          }
          if (obsureText && value.length < 8) {
            return "password should be  at least 8 length";
          }
          if (label != "Phone" && !obsureText && !value.contains("@")) {
            return "email is not correct";
          }
          return null;
        },
      ),
      const SizedBox(
        height: 5,
      )
    ],
  );
}
