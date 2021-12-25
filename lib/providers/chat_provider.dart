import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/resources/Strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ChatProvider {

  static User? get currentUser => FirebaseAuth.instance.currentUser;

  static Future<QuerySnapshot<Map<String, dynamic>>> getUsers({required String query}) {
    
    return FirebaseFirestore.instance
      .collection(Strings.usersCollection)
      .limit(50)
      .where(
        Strings.userModelName,
        isGreaterThanOrEqualTo: query,
        isLessThan: query.substring(0, query.length-1) + String.fromCharCode(query.codeUnitAt(query.length - 1) +1))
      .get();
  }

  static Stream<QuerySnapshot<dynamic>> getRoomMessages({required String peerId}){
    List<String> _ids = _sortIds(peerId);
    return FirebaseFirestore.instance
        .collection(Strings.roomsCollection)
        .doc(_ids[0] +":"+ _ids[1])
        .collection(Strings.messagesCollection)
        .orderBy(Strings.messageModelTimeStamp, descending: true)
        .snapshots();
  }



  static void setMessage({required String peerId, required String message}) {
    List<String> _ids = _sortIds(peerId);

    MessageModel _messageModel = MessageModel(
      textMessage: message,
      userId: currentUser?.uid ?? UniqueKey().toString(),
      timeMessage: DateTime.now()
    );

    FirebaseFirestore.instance
        .collection(Strings.roomsCollection)
        .doc(_ids[0] +":"+ _ids[1])
        .collection(Strings.messagesCollection)
        .add(MessageModel.toMap(_messageModel));

  }


  static List<String> _sortIds(String peerId) {
    List<String> _ids = [];
    String _currentUser = currentUser?.uid ?? UniqueKey().toString();
    _ids..add(_currentUser)
        ..add(peerId);
    _ids.sort();
    return _ids;
  }
}