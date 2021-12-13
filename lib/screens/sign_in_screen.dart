import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:chat_app/utils/app_config.dart';
import 'package:chat_app/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/text_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: AppConfig.heightScreen(context),
          padding: const EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 39
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(ImagesPath.logo),
                )
              ),
              Expanded(
                child: Text(
                  Strings.titleApp,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Spacer(),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldWidget(hintText: Strings.email),
                    TextFieldWidget(hintText: Strings.password),
                    ButtonWidget(
                      buttonText: Strings.signIn,
                      onPressed:() => Navigator.pushNamed(context, MESSAGES_PAGE,),)
                  ],
                ),
              ),
              SizedBox(
                height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Strings.noAccount),
                  TextButton(
                    onPressed: () =>  Navigator.pushNamed(context, SIGN_UP_PAGE),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(" " + Strings.signUp,
                      style: MyTextStyles.bodyLink,
                    ),
                  )
                ]
              ),
              Spacer(),
              TextButton(
                onPressed: () => print("Mot de passe oublié"),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(Strings.forgetPassword,
                  style: MyTextStyles.bodyLink
                ),
              ),
              Spacer(),
            ]
          ),
        ),
      )
    );
  }
}


