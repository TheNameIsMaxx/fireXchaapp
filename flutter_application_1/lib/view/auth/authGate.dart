import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/app/homePage.dart';
import 'package:flutter_application_1/view/auth/loginOrRegister.dart';

class authGat extends StatelessWidget {
  const authGat({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context,snapshot){
        if(snapshot.hasData){
          return homePage();
        }
        else{
          return loginOrRegister();
        }
       }
       );
  }
}