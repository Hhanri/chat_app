import 'package:chat_app/providers/authentication_provider.dart';
import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/screens/messages_screen.dart';
import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:chat_app/utils/navigation_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return FutureBuilder(
      //Initialize Firebase
      future: Firebase.initializeApp(),
      builder: (initFirebaseContext, snapshot) {
        //Check for errors
        if (snapshot.hasError){
          NavigationUtils.showMyDialog(context: initFirebaseContext, bodyText: Strings.errorFirebaseInit);
        }
        //Once completed, show app
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (providerContext) => AuthenticationProvider())
            ],
            builder: (providerContext, widget) {
              return MaterialApp(
                title: Strings.titleApp,
                theme: theme,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: RouteGenerator.generateRoute,
                home: StreamBuilder(
                  stream: AuthenticationProvider().userState,
                  builder: (authStreamContext, snapshot) {
                    if (snapshot.hasError) {
                      NavigationUtils.showMyDialog(context: authStreamContext, bodyText: Strings.errorAuthStream);
                      return SignInScreen();
                    } else {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      else {
                        if (snapshot.data != null) {
                          return MessagesScreen();
                        } else {
                          return SignInScreen();
                        }
                      }
                    }
                  }
                ),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

