import 'package:flutter/material.dart';

Dialogbox(BuildContext context , String title,String content){
   showAdaptiveDialog(
    context: context,
     builder: (context){
      return AlertDialog.adaptive(
        title: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        content: Text(content),
      );
     }
     );
}