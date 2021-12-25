import 'package:chat_app/screens/room_screen.dart';
import 'package:chat_app/screens/messages_screen.dart';
import 'package:chat_app/screens/search_screen.dart';
import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:chat_app/screens/unknown_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    final _arguments = settings.arguments;


    switch(settings.name) {
      case SIGN_IN_PAGE : return MaterialPageRoute(builder: (_) => SignInScreen());
      case SIGN_UP_PAGE : return MaterialPageRoute(builder: (_) => SignUpScreen());
      case MESSAGES_PAGE : return MaterialPageRoute(builder: (_) => MessagesScreen());
      case ROOM_PAGE : return MaterialPageRoute(builder: (_) => RoomScreen(peerUserArgument: _arguments));
      case SEARCH_PAGE : return MaterialPageRoute(builder: (_) => SearchScreen());
      case MAIN_APP : return MaterialPageRoute(builder: (_) => MyApp());
      default : return MaterialPageRoute(builder: (_) => UnknownScreen());
    }
  }
}

const String SIGN_IN_PAGE = "/SignIn";
const String SIGN_UP_PAGE = "/SignUp";
const String MESSAGES_PAGE = "/Messages";
const String ROOM_PAGE = "/Chat";
const String SEARCH_PAGE = "/Search";
const String MAIN_APP = "/Main";