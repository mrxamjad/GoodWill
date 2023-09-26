import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_will/backend/getColorByName.dart';
import 'package:good_will/widget/rowHeading.dart';

Container winnerList({String id="ID",String duo="red",String trio="purple",String neo="blue",String totalWinner="100", })
{
  return Container(
    margin: const EdgeInsets.symmetric( horizontal: 12, vertical: 1),
    padding:const EdgeInsets.symmetric( horizontal: 3, vertical: 5) ,

    decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        rowHeading(id, flex: 2, textColor: Colors.teal, bgColor: Colors.white, fontSize: 10),
        rowHeading(duo,bgColor: getColorByName(duo), fontSize: 11),
        rowHeading(trio,bgColor: getColorByName(trio),fontSize: 11),
        rowHeading(neo,bgColor: getColorByName(neo),fontSize: 11),
        rowHeading(totalWinner,textColor: Colors.teal, bgColor: Colors.white,fontSize: 10),
      ],
    ),
  );
}