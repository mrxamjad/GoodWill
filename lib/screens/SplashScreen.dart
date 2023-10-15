import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:good_will/Constants/DataKey.dart';
import 'package:good_will/backend/SharedPref.dart';
import 'package:good_will/data/Data.dart';
import 'package:good_will/screens/HomeScreen.dart';
import 'package:good_will/screens/NavigationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String userId="";

  void setUser() async {
    SharedPreferences pref= await SharedPreferences.getInstance();
    try{
      userId = pref.getString(DataKey.userId)!;
      DataClass.userKey=userId;
    }catch(e){
      print('Error in iinitializing SharedPregerences');


    }
    print("SharedPref: UserId $userId");
  }

  @override
  void initState() {
    // TODO: implement initState
    setUser();
    print("User is in init state" + userId.toString());
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    print("User is in Build Conte" + userId.toString());
    return AnimatedSplashScreen(
      splash: 'assets/logo1.png',
      nextScreen:
          userId.isEmptyOrNull ? LoginScreen() : BottomNavigationBarExampleApp(),
      splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.,
    );
  }
}
