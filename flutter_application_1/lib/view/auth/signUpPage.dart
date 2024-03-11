import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/app/homePage.dart';
import 'package:flutter_application_1/view/auth/firebase_auth_service.dart';
import 'package:flutter_application_1/view/auth/login.dart';
import 'package:flutter_application_1/view/widgets/button.dart';
import 'package:flutter_application_1/view/widgets/dailogBox.dart';
import 'package:flutter_application_1/view/widgets/textFields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class signUPPage extends StatefulWidget {
  signUPPage({super.key});

  @override
  State<signUPPage> createState() => _signUPPageState();
}

class _signUPPageState extends State<signUPPage> {
  final emailController = TextEditingController();

  final passController  = TextEditingController();

  final confirmPassController  = TextEditingController();

  void signUP(){
    final _auth = AuthService();
   if(passController.text==confirmPassController.text){
    try{
       _auth.signUpWithEmailandpasswrod(context,emailController.text, passController.text).then((value) {
        Get.to(homePage());
       });
    }
    catch(ex){
       Dialogbox(
        context,
         "SignUpPage Error", 
         ex.toString()
         );
    }
    }
    else{
      showAdaptiveDialog(
        context: context,
         builder: (context){
          return AlertDialog.adaptive(
            title:const  Text("Error Alert"),
            content:const Text("password not match"),
          );
    }
      );
      }
        }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff614385), Color(0xff516395)])),
            child: Center(
              child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          height: 550,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "S I G N UP",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              textField(
                                  controller: emailController,
                                  text: "Enter Email",
                                  label: "Email",
                                  iconData: Icons.email_rounded),
                              textField(
                                  controller: passController,
                                  text: "Password",
                                  label: "Password",
                                  iconData: Icons.password_rounded),
                              textField(
                                  controller: confirmPassController,
                                  text: "Password",
                                  label: "Password",
                                  iconData: Icons.password_rounded),
                              SizedBox(
                                height: 24.h,
                              ),
                              elevatBotton(
                                  onPressed: signUP, text: "SignUp", height: 45, width: 120,color: Colors.deepPurpleAccent,),
                              SizedBox(height: 20.h,),
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 const  Text("already have an account",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  TextButton(
                                            onPressed: (){
                                              Get.to(loginScreen());
                                            },
                                             child:const Text("LogIn",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                                             ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                  ),
            ),
          )
        ],
      ),
    );
  }
}