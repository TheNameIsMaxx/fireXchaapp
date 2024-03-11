// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class elevatBotton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  double height;
  double width;
  Color? color;
   elevatBotton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.height,
    required this.width,
    this.color
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width:width ,
      child: ElevatedButton(
        onPressed: onPressed,
         child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),),
         style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
         ),
         ),
    );
  }
}