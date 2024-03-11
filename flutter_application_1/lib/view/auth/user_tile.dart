import 'package:flutter/material.dart';

class userTile extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
   // ignore: prefer_const_constructors_in_immutables
   userTile({
    super.key,
    required this.ontap,
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade300
        ),
        child: Center(
          child: ListTile(
            leading:CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              child: const Icon(Icons.person,color: Colors.white,)),
            title: Text(text,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          )
        ),
      ),
    );
  }
}