import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/app/homePage.dart';
import 'package:flutter_application_1/view/auth/firebase_auth_service.dart';
import 'package:flutter_application_1/view/auth/signUpPage.dart';
import 'package:flutter_application_1/view/widgets/button.dart';
import 'package:flutter_application_1/view/widgets/dailogBox.dart';
import 'package:flutter_application_1/view/widgets/textFields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class loginScreen extends StatefulWidget {
  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final emailController = TextEditingController();

  final passController = TextEditingController();

  //  final authServie = AuthService();

  void login(BuildContext context)async{
    try{
      AuthService().signWithEmailPass(context, emailController.text, passController.text).then((value){
        Get.to(homePage());
      });
      }
    catch(ex){
      Dialogbox(
        context,
         "LogPage Error", 
         ex.toString()
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
            decoration:const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff614385), Color(0xff516395)])),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                          height: 500,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "L O G I N",
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
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  elevatBotton(
                                      onPressed: () {
                                      login(context);
                                      }, text: "LogIn", height: 45, width: 120,color: Colors.deepPurpleAccent,),

                                      
                                      TextButton(
                                        onPressed: (){
                                          
                                        },
                                         child:const Text("forgot password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                                         ),
                                ],
                              ),
                              SizedBox(height: 20.h,),
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 const  Text("don't have an account",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  TextButton(
                                            onPressed: (){
                                             Get.to(signUPPage());
                                            },
                                             child:const Text("SignUP",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
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
