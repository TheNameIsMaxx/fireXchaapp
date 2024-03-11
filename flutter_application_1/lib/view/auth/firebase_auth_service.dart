import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widgets/dailogBox.dart';


class AuthService {
  //firebase auth instance
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //sign in mathod
  Future<UserCredential>signWithEmailPass(BuildContext context, email,String password)async{
    UserCredential userCredential;
    try{
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).set(
        {
          "email":email,
          "password":password
        }
      );
       return userCredential;
    }
    on FirebaseAuthException catch(ex){
    return  Dialogbox(
        context, 
        "LogIn Error",
         ex.code.toString()
         );
        
    }
  }

  //logout funtion
  Future<void> signOut() async {
    return await _auth.signOut();
  }

//signUp mathod

    Future<UserCredential>signUpWithEmailandpasswrod(BuildContext context,String email, String password)async{
      try{ 
        UserCredential userCredential;
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);//create user on firebase with email
        FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).set(
          {
            "email":email,
            "password":password
          }
        );

        return userCredential;
      }
      on FirebaseAuthException catch(ex){
      return  Dialogbox(
          context, 
          "SignUp Error", 
          ex.code.toString()
          );
      }
    }

 }
