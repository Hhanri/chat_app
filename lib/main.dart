import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}

