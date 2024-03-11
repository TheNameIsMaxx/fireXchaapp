// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  TextEditingController controller;
  String text;
  String label;
  IconData iconData;

  textField(
      {super.key,
      required this.controller,
      required this.text,
      required this.label,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: SizedBox(
        height: 47,
        width: double.infinity,
        child: TextField(
          controller: controller,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              hintText: text,
              label: Text(label),
              prefixIcon: Icon(iconData)),
        ),
      ),
    );
  }
}
