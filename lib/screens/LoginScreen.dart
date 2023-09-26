
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:good_will/screens/HomeScreen.dart';
import 'package:good_will/screens/SignupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  final _formKey=GlobalKey<FormState>();
  TextEditingController emailController= TextEditingController();
  TextEditingController passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      const Text ("Login", style: TextStyle(
                        fontSize: 30,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 20,),
                      Column( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Welcome back!",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),),
                          Text(" Login with your credentials",style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),),

                        ],
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40
                    ),
                    child: Column(
                      children: [
                        makeInput(emailController,label: "Email"),
                        makeInput(passController,label: "Password",obsureText: true),
                      ],
                    ),
                  ),
                 const SizedBox(height: 20),
                  InkWell(
                    onTap: (){
                      // context.nextPage(HomeScreen());
                    },
                    child: Padding(
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
                              try {
                                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text
                                );
                                User? user= credential.user;
                                String id=user!.uid;
                                print("User Id : $id");


                                SharedPreferences pref= await SharedPreferences.getInstance();
                                pref.setString("user_id",id! );

                                context.nextAndRemoveUntilPage(HomeScreen());


                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  context.showToast(msg: "No user found for that email.", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);

                                } else if (e.code == 'wrong-password') {

                                  context.showToast(msg: "Wrong password provided for that user.", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);

                                }else{
                                  context.showToast(msg: "Login Failed!.", bgColor: Colors.red, textColor: Colors.white, position: VxToastPosition.top);


                                }
                              }

                            }
                          },
                          color: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: const Text("Login",style: TextStyle(
                              fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white
                          ),),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      InkWell(
                        onTap: (){
                          context.nextPage(SignupScreen());

                        },
                        child: const Text(" SignUp",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          color: Colors.teal

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
        controller: controller,
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!)
          ),
        ),
        validator: (value) {
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
