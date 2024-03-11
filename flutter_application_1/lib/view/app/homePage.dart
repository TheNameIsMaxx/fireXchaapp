import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/chatService.dart';
import 'package:flutter_application_1/view/app/Appdrawer.dart';
import 'package:flutter_application_1/view/app/chatpage.dart';
import 'package:flutter_application_1/view/auth/firebase_auth_service.dart';
import 'package:flutter_application_1/view/auth/user_tile.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // final ChatService _chatService = ChatService();
  // final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("HomePage",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer:const  myDrawer(),
      body: builUserList(),
    );
  }

  Widget builUserList(){
   return StreamBuilder(
      stream: ChatService().getUserStream(), 
      builder: (context,snapshot){
        try{
          if(snapshot.hasError){
          return const  Center(child: Text("Error"));
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const  Center(
            child: CircularProgressIndicator()
            );
        }
        return ListView(
          children: snapshot.data!.map<Widget>((userData)=>_builListItems(userData,context)).toList(),
        );
        }
        catch(ex){
           showAdaptiveDialog(
            context: context, 
            builder: (context){
              return AlertDialog.adaptive(
                title:const Text("UserList Error",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                content: Text(ex.toString()),
                actions: [
                  TextButton.icon(
                    onPressed: (){
                      Get.back();
                    },
                     icon:const Icon(Icons.cancel_outlined),
                      label:const Text("Ok")
                      ),
                ],
              );
            }
            );
            return Container();
        }
      }
      );
  }

  //show only current chating users
  Widget _builListItems(Map<String,dynamic>userData,BuildContext context){
    try{
      if(userData['email']!=AuthService().getCurrentUser()!.email){
      return userTile(
      ontap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>chatPage(
          reciveEmail: userData['email'],
          reciverID: userData['uid'],
        )));
      }, 
      text: userData['email'],
      );
    }
    else{
      return Container();
    }
    }
    catch(ex){
      showAdaptiveDialog(
            context: context, 
            builder: (context){
              return AlertDialog.adaptive(
                title:const Text("UserTile Error",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                content: Text(ex.toString()),
                actions: [
                  TextButton.icon(
                    onPressed: (){
                      Get.back();
                    },
                     icon:const Icon(Icons.cancel_outlined),
                      label:const Text("Ok")
                      ),
                ],
              );
    }
    );
    return Container();
}
  }
}