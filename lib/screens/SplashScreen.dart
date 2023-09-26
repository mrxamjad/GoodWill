import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:good_will/backend/SharedPref.dart';
import 'package:good_will/screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userId;

  void setUser() async {
    userId=await SharedPref.getUser();
    print("SharedPref: UserId $userId");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setUser();
    // print("User is in init state"+userId.toString());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // userId= await SharedPref.getUser();
      Timer.run(() {

      });
      setUser();
      print("User is in init state"+userId.toString());
    });

  }




  @override
  Widget build(BuildContext context) {
    print("User is in Build Conte"+userId.toString());
    return  AnimatedSplashScreen(
      splash: 'assets/logo1.png',
      nextScreen:userId==null?LoginScreen():HomeScreen(),
      splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.,
    );
  }
}
