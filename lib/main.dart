import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_will/Constants/ConstColor.dart';
import 'package:good_will/getx/controller/depencyInjection.dart';
import 'package:good_will/screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ColorWala',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,

        // primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
