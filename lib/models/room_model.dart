import 'dart:convert';

import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/resources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomModel {
  final String? roomId;
  final List<String> userIds;
  final String? lastMessage;
  final String? lastId;
  final DateTime? lastDateMessage;
  UserModel? peerUser;

  RoomModel({
    required this.roomId,
    required this.userIds,
    this.lastMessage,
    this.lastId,
    this.lastDateMessage,
    this.peerUser
  });


  factory RoomModel.fromJson(Map<String, dynamic> jsonData) {
    return RoomModel(
      roomId: jsonData[Strings.roomIdFirestore] ?? "",
      userIds: jsonData[Strings.idsArrayFirestore].cast<String>() ?? ["", ""],
      lastMessage: jsonData[Strings.lastMessageFirestore] ?? "",
      lastId: jsonData[Strings.lastIdFirestore] ?? "",
      lastDateMessage: jsonData[Strings.lastDateMesageFirestore].toDate() ?? DateTime.now(),
    );
  }

  static Map<String, dynamic> toMap(RoomModel roomModel) => {
    Strings.roomIdFirestore: roomModel.roomId,
    Strings.idsArrayFirestore: roomModel.userIds,
    Strings.lastMessageFirestore: roomModel.lastMessage,
    Strings.lastIdFirestore: roomModel.lastId,
    Strings.lastDateMesageFirestore: roomModel.lastDateMessage
  };

  static String encodeRooms(List<RoomModel> rooms) {
    return json.encode(
      rooms.map(
        (room) => RoomModel.toMap(room)).toList()
    );
  }

  static List<RoomModel> decodeRooms(List<QueryDocumentSnapshot<dynamic>> queryRooms) {
    return queryRooms.map(
      (room) => RoomModel.fromJson(room.data())
    ).toList();
  }

}