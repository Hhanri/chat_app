import 'package:chat_app/resources/Strings.dart';
import 'package:flutter/cupertino.dart';

class UserModel {
  final UniqueKey uniqueKey;
  final String? userName;
  final String? imagePath;

  UserModel({
    required this.uniqueKey,
    required this.userName,
    required this.imagePath
    }
  );
}

Map<int, UserModel> users = {
  1 : UserModel(
      uniqueKey: UniqueKey(),
      userName: 'Emma',
      imagePath: "assets/pp/Emma.png"
  ),
  2 : UserModel(
      uniqueKey: UniqueKey(),
      userName: 'Julie',
      imagePath: "assets/pp/Julie.png"
  ),
  3 : UserModel(
      uniqueKey: UniqueKey(),
      userName: 'Garou',
      imagePath: "assets/pp/Garou.png"
  ),
  4 : UserModel(
      uniqueKey: UniqueKey(),
      userName: 'Pierre',
      imagePath: "assets/pp/Pierre.png"
  ),
  5 : UserModel(
      uniqueKey: UniqueKey(),
      userName: 'Estelle',
      imagePath: "assets/pp/Estelle.png"
  ),
  6 : UserModel(
      uniqueKey: UniqueKey(),
      userName: 'Margot',
      imagePath: "assets/pp/Margot.png"
  ),
};