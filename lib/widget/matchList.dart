
import 'package:flutter/material.dart';
import 'package:good_will/backend/getColorByName.dart';
import 'package:good_will/widget/rowHeading.dart';

Container matchList({String id="ID",String match="NOVEL",String process="Finished",String status="Won",String totalWinner="₹100000", })
{
  return Container(
    margin: const EdgeInsets.symmetric( horizontal: 12, vertical: 5),
    padding:const EdgeInsets.symmetric( horizontal: 3, vertical: 5) ,

    decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 1, color: Colors.teal)

    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        rowHeading(id, flex: 2, textColor: Colors.teal, bgColor: Colors.white, fontSize: 10),
        rowHeading(match,bgColor: Colors.teal, fontSize: 11),
        rowHeading(process,bgColor: getColorByName(process),fontSize: 11),
        // if(process=="Finished")
        rowHeading(status,bgColor: getColorByName(status),fontSize: 11),
        rowHeading(totalWinner,textColor: Colors.teal, bgColor: Colors.teal[100]!,fontSize: 12 ),
      ],
    ),
  );
}