
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../screens/WalletScreen.dart';

InkWell ProfileItem({required BuildContext context, required String title , required Widget widget , required IconData icon}){
  return InkWell(
      onTap: (

          ){
        context.nextPage( widget);
      },
      child: Container( margin: EdgeInsets.only( left: 20),
          height: 50, width: double.infinity,
          child: Row(
            children: [
              Container(
                
                height: 50, width: 50,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)
                        
                  ),
                  child: Icon(icon, color: Colors.white,)),
              Text(title, style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16), ),
            ],
          )));
}