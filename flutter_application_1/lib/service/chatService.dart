// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/model/message_model.dart';

 class ChatService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;



  Stream<List<Map<String,dynamic>>>getUserStream(){
    return _firestore.collection("Users").snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  Future<void>sendMessage(String reciverId,String message)async{
    //get current user info
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp =  Timestamp.now();

    //create a new message
    // ignore: unused_local_variable
    Message newMessage = Message(
      senderID: currentUserId, 
      senderEmail: currentUserEmail,
       reciverID: reciverId,
        message: message,
         timestamp: timestamp
         );

         //construct chat room id for the two users (sorted to ensure uniqueness)
         List<String>ids=[currentUserId,reciverId];
         ids.sort();
         String chatRoomId = ids.join('_');

         //add new message to database
         await _firestore.collection("chat_Room").doc(chatRoomId).collection("messages").add(newMessage.toMap());

         
  }
  //get messages
         Stream<QuerySnapshot>getMessage(String userID,otherUserID){
          //construct a chatroom id for the two users
          List<String>ids = [userID,otherUserID];
          ids.sort();
          String chatRoomID = ids.join('_');

          return _firestore
          .collection("chat_Room")
          .doc(chatRoomID)
          .collection("messages")
          .orderBy('timestamp',
          descending: false).snapshots();
         }
}