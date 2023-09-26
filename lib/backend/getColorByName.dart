import 'package:flutter/material.dart';

Color getColorByName( String name){
  if (name=="red") return Colors.red;
  if (name=="green") return Colors.green;
  if (name=="pink") return Colors.pink;
  if (name=="blue") return Colors.blue;
  if (name=="purple") return Colors.purple;
  if (name=="1") return Colors.red;
  if (name=="2") return Colors.green;
  if (name=="3") return Colors.purple;
  if (name=="4") return Colors.blue;
  if (name=="5") return Colors.amber;
  if (name=="6") return Colors.pink;
  if (name=="7") return Colors.brown;
  if (name=="8") return Colors.teal;


  return Colors.white;
}