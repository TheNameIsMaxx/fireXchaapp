import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/auth/login.dart';
import 'package:flutter_application_1/view/auth/signUpPage.dart';

class loginOrRegister extends StatefulWidget {
   loginOrRegister({super.key});

  @override
  State<loginOrRegister> createState() => _loginOrRegisterState();
}

class _loginOrRegisterState extends State<loginOrRegister> {
  bool ShowLoginPage = true;

  void togglePage(){
    setState(() {
      ShowLoginPage = !ShowLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(ShowLoginPage){
      return loginScreen();
    }
    else{
      return signUPPage();
    }
  }
}