import 'dart:convert';

import 'package:chat_app/resources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel {
  final String? userId;
  final String? userName;
  final String? imagePath;

  UserModel({
    required this.userId,
    required this.userName,
    required this.imagePath
    }
  );

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      userId: jsonData[Strings.userModelId],
      userName: jsonData[Strings.userModelName],
      imagePath: jsonData[Strings.userModelImagePath]
    );
  }

  static Map<String, dynamic> toMap(UserModel userModel) => {
    Strings.userModelId: userModel.userId,
    Strings.userModelName: userModel.userName,
    Strings.userModelImagePath: userModel.imagePath
  };

  static String encodeUsers(List<UserModel?> users) {
    return json.encode(
      users.map(
        (user) => UserModel.toMap(user!)).toList()
    );
  }

  static List<UserModel?> decodeUsers(List<QueryDocumentSnapshot<dynamic>> queryUsers) {
    return queryUsers.map(
      (user) => UserModel.fromJson(user.data())
    ).toList();
  }
}



Map<int, UserModel> users = {
  0 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Emma',
      imagePath: "assets/pp/Emma.png"
  ),
  1 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Julie',
      imagePath: "assets/pp/Julie.png"
  ),
  2 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Garou',
      imagePath: "assets/pp/Garou.png"
  ),
  3 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Pierre',
      imagePath: "assets/pp/Pierre.png"
  ),
  4 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Estelle',
      imagePath: "assets/pp/Estelle.png"
  ),
  5 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Margot',
      imagePath: "assets/pp/Margot.png"
  ),
  6 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Emma',
      imagePath: "assets/pp/Emma.png"
  ),
  7 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Julie',
      imagePath: "assets/pp/Julie.png"
  ),
  8 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Garou',
      imagePath: "assets/pp/Garou.png"
  ),
  9 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Pierre',
      imagePath: "assets/pp/Pierre.png"
  ),
  10 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Estelle',
      imagePath: "assets/pp/Estelle.png"
  ),
  11 : UserModel(
      userId: UniqueKey().toString(),
      userName: 'Margot',
      imagePath: "assets/pp/Margot.png"
  ),
};