
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:good_will/firebase/FirebaseService.dart';
import 'package:good_will/screens/LoginScreen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/ConstColor.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController= TextEditingController();TextEditingController passController= TextEditingController();TextEditingController confirmPassController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   backgroundColor: Colors.white,
      //   leading:
      //   IconButton( onPressed: (){
      //     Navigator.pop(context);
      //   },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                  child: Image.asset('assets/signup.jpg', height: 250,)),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
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
                              const Text ("Sign up", style: TextStyle(
                                fontSize: 30,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 20,),
                              Row( mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Create an Account,",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold
                                  ),),const Text(" Its free",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),),
                                ],
                              ),
                              SizedBox(height: 30,)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40
                            ),
                            child: Column(
                              children: [
                                makeInput( emailController,label: "Email"),
                                makeInput(passController,label: "Password",obsureText: true),
                                makeInput(confirmPassController,label: "Confirm Pasword",obsureText: true)
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Container(
                              padding: EdgeInsets.only(top: 3,left: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: const Border(
                                      bottom: BorderSide(color: Colors.black),
                                      top: BorderSide(color: Colors.black),
                                      right: BorderSide(color: Colors.black),
                                      left: BorderSide(color: Colors.black)
                                  )
                              ),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height:60,
                                onPressed: () async {
                                  if(_formKey.currentState!.validate()){
                                    if(passController.text==confirmPassController.text){
                                      print("Password Matched");
                                      // context.showLoading(msg: "Creating Account..", textColor: Colors.white, bgColor: Colors.teal);


                                      try {
                                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passController.text,
                                        );

                                        String uid= credential.user!.uid;

                                        FirebaseService.createUser(uid, emailController.text.split("@").first, emailController.text).then((value) {
                                          context.showToast(msg: "Account Created Successfully", textColor: Colors.white, bgColor: Colors.teal,position: VxToastPosition.center);
                                          context.pop();

                                          context.nextAndRemoveUntilPage(LoginScreen());
                                          emailController.clear();
                                          passController.clear();

                                        });




                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'weak-password') {
                                          context.showToast(msg: "The password provided is too weak.", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);

                                        } else if (e.code == 'email-already-in-use') {

                                          context.showToast(msg: "The account already exists for that email.", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);

                                        }else{
                                          context.showToast(msg: "SingUp Failed!", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);

                                        }
                                      } catch (e) {
                                        print(e);
                                      }

                                    }else{
                                      print(passController.text);
                                      print(confirmPassController.text);
                                      print("Password mismatched");

                                      context.showToast(msg: "Password mismatch!", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);
                                    }

                                  }else{
                                    print("Form is not validated");
                                  }


                                },
                                color: Colors.teal,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)
                                ),
                                child: const Text("Sign Up",style: TextStyle(
                                  fontWeight: FontWeight.w600,fontSize: 16, color: Colors.white

                                ),),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                               Text("Already have an account? ", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.grey[700]!),),
                              InkWell(
                                onTap: () =>  context.nextAndRemoveUntilPage(LoginScreen()),

                                child: const Text("Login",style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color:Colors.teal,
                                    fontSize: 18
                                ),),
                              ),
                            ],
                          )
                        ],

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeInput(TextEditingController controller,{label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.teal
      ),),
      const SizedBox(height: 5,),
      TextFormField(
        obscureText: obsureText,
      controller: controller,
       decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal[400]!,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!)
          ),
        ),
        validator:   (value) {
          if (value == null || value.isEmpty) {
            return "$label can't be empty" ;
          }
          if(obsureText && value.length<8){
            return "Password should be  at least 8 length";

          }
          if(!obsureText && !value.contains("@")){
            return "Please enter a valid mail";
          }
          return null;
        },
    ),
      const SizedBox(height: 10,)

    ],
  );
}
