import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static late SharedPreferences _pref;

   static Future<void> initPref() async {
     try {
       _pref = await SharedPreferences.getInstance();
     }catch(e){
       if (kDebugMode) {
         print("Failed to initialized SharePreferences");
       }
     }
  }


  static Future<void> setUser(String user) async {
    await initPref();
    try{
    _pref.setString("user_id", user);}catch(e){
      if (kDebugMode) {
        print("SharedPref: Failed to set user");
      }
    }


  }

  static Future<String?> getUser() async {
     await initPref();
     try{
       return _pref.getString("user_id");
     }catch( e){
       if (kDebugMode) {
         print("SharedPref: Failed to get user");
       }
     }
     return "";
  }

}