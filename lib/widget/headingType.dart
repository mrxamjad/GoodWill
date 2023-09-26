
import 'package:flutter/material.dart';

Card headingType( String heading) {
  return

    Card(
      color: Colors.teal[100],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight:
              Radius.circular(20),
              bottomLeft:
              Radius.circular(20))),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 45, vertical: 1),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight:
                Radius.circular(20),
                bottomLeft:
                Radius.circular(20))),
        child:  Text(
          heading,
          style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
}