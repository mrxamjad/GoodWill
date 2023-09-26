import 'package:flutter/material.dart';

Color getColorByName( String name){
  if (name=="Red" || name=="red") return Colors.red;
  if (name=="Green" ||name=="green") return Colors.green;
  if (name=="Pink" || name=="pink") return Colors.pink;
  if (name=="Blue" || name=="blue") return Colors.blue;
  if (name=="Purple" || name=="purple") return Colors.purple;
  if (name=="1") return Colors.red;
  if (name=="2") return Colors.green;
  if (name=="3") return Colors.purple;
  if (name=="4") return Colors.blue;
  if (name=="5") return Colors.amber;
  if (name=="6") return Colors.pink;
  if (name=="7") return Colors.brown;
  if (name=="Lose" || name=="lose") return Colors.red;
  if (name=="Won" || name=="won") return Colors.green;
  if (name=="Finished" || name=="finished") return Colors.grey;
  if (name=="Going" || name=="going") return Colors.purple;





  return Colors.teal;
}