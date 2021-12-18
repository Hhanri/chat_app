import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (initFirebaseContext, snapshot) {
        if (snapshot.hasError){
          showDialog(
            context: initFirebaseContext,
            builder: (_) {
              return Dialog(
                child: Text(
                  Strings.errorFirebaseInit
                )
              );
            }
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Chat App',
            theme: theme,
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            onGenerateRoute: RouteGenerator.generateRoute,
            home: const SignInScreen(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

