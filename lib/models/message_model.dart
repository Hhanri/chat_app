import 'dart:convert';

import 'package:chat_app/resources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel{

  final String textMessage;
  final DateTime timeMessage;
  final String userId;

  MessageModel({
    required this.textMessage,
    required this.timeMessage,
    required this.userId
  });

  factory MessageModel.fromJson(Map<String, dynamic> jsonData) {
    return MessageModel(
        textMessage: jsonData[Strings.messageModelTextMessage],
        timeMessage: jsonData[Strings.messageModelTimeStamp].toDate(),
        userId: jsonData[Strings.userModelId]
    );
  }

  static Map<String, dynamic> toMap(MessageModel messageModel) => {
    Strings.messageModelTextMessage: messageModel.textMessage,
    Strings.messageModelTimeStamp: messageModel.timeMessage,
    Strings.userModelId: messageModel.userId
  };

  static String encodeMessages(List<MessageModel?> messages) {
    return json.encode(
        messages.map(
                (message) => MessageModel.toMap(message!))
    );
  }

  static List<MessageModel?> decodeMessages(List<QueryDocumentSnapshot<dynamic>> queryMessages) {
    return queryMessages.map(
            (message) => MessageModel.fromJson(message.data())
    ).toList();
  }
}