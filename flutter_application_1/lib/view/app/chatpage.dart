// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'dart:ui_web';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/chatService.dart';
import 'package:flutter_application_1/view/auth/firebase_auth_service.dart';

// ignore: must_be_immutable
class chatPage extends StatefulWidget {
  final String? reciveEmail; 
  final String? reciverID;
  chatPage({super.key,
  required this.reciveEmail,
  required this.reciverID
  });

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  final messageController = TextEditingController();

  final AuthService _authService = AuthService();

  final ChatService _chatService = ChatService();

  void sendMessage()async{
    //if there is something inside the textfield
    if(messageController.text.isNotEmpty){
      //send the message
      await _chatService.sendMessage("${widget.reciverID}", messageController.text);
    }
  }

  @override
  void dispose() {
     messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.reciveEmail}"),
      ),
    body: Column(
      children: [
        Expanded(
          child: _buildMessageList()
        ),
        _buildUserInput()
      ],
    ),
    );
  }

  Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessage("${widget.reciverID}", senderID),
       builder: (context,snapshot){
        //error
        if(snapshot.hasError){
        return const  Text("Error");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("loading..");
        }
        return ListView(
          children: snapshot.data!.docs.map((doc)=>buildMessageItem(doc)).toList(), //
        );
       }
       );
  }

  Widget buildMessageItem(DocumentSnapshot doc){
    Map<String,dynamic>data =doc.data() as Map<String,dynamic>;
    //is current user
    bool isCurrentUser = data['senderID']==_authService.getCurrentUser()!.uid;

    // ignore: unused_local_variable
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              decoration:const  BoxDecoration(
                borderRadius:BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
              ),
              child: Text(data['message'])),
          ],
        ),
      ));
  }

  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      child: Row(
        children: [
          Expanded(
            child:Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(.6)
              ),
              child: TextField(
                controller: messageController,
                decoration:const InputDecoration(
                  border:InputBorder.none,
                  hintText: "type a message...",
                   ),
              ),
            )
          ),
          CircleAvatar(
            backgroundColor: Colors.deepPurple,
            child: IconButton(
              onPressed: (){
                sendMessage();
              },
               icon:const Icon(Icons.send,color: Colors.white,)
               ),
          )
        ],
      ),
    );
  }
}