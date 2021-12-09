import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/text_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(ImagesPath.logo),
          Text(
            Strings.titleApp,
            style: Theme.of(context).textTheme.headline1,
          ),
          TextFieldWidget(hintText: Strings.email),
          TextFieldWidget(hintText: Strings.password),
          ButtonWidget(buttonText: Strings.signIn),
          Row(
            children: [
              Text(Strings.noAccount),
              Text(Strings.signUp)
            ]
          ),
          Text(Strings.forgetPassword)
        ]
      )
    );
  }
}


