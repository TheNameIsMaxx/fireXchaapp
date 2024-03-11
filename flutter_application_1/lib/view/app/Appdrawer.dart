import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {

   LogOut(){
      showAdaptiveDialog(
        context: context, 
        builder: (context){
          return AlertDialog.adaptive(
            title:const Text("Warning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            content:const Text("Are you sure for logOut"),
            actions: [
              TextButton(
                onPressed: (){
                  Get.back();
                },
                 child:const  Text("No")
                 ),
                 TextButton(
                onPressed: ()async{
                  await FirebaseAuth.instance.signOut().then((value){
                    Get.back();
                  });
                },
                 child:const  Text("Yes")
                 ),
            ],
          );
        }
        );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerHeader(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.deepPurple,
              child:const Icon(Icons.message_outlined,size: 30,),
            ),
            ),
            Column(
              children: [
                ListTile(
                  leading:const  Icon(Icons.home),
                  title: const Text("Home"),
                ),
                 ListTile(
              leading:const  Icon(Icons.settings),
              title: const Text("Setting"),
            ),
            ListTile(
              leading:const  Icon(Icons.help),
              title: const Text("Help"),
            ),
              ],
            ),
           
            ListTile(
              onTap: (){
                LogOut();
              },
              leading:const  Icon(Icons.logout),
              title: const Text("LogOut"),
            ),
            
        ],
      )
        
        
    );
  }
}