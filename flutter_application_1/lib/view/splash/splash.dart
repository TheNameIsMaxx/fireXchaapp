import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/auth/loginOrRegister.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
   Get.to(loginOrRegister());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image:const DecorationImage(image: AssetImage("assets/splashLogo.png",),scale: 3)
              ),
            )
          ],
        ),
      ),
    );
  }
}