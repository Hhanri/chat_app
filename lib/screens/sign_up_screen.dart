import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:chat_app/utils/app_config.dart';
import 'package:chat_app/widgets/button_widget.dart';
import 'package:chat_app/widgets/checkbox_widget.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  Text(
                    Strings.signUpTitle,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Spacer(),
                  Expanded(
                    flex: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWidget(hintText: Strings.email, email: true),
                        TextFieldWidget(hintText: Strings.password, password: true),
                        TextFieldWidget(hintText: Strings.name),
                        TextFieldWidget(hintText: Strings.birthday, icon: IconWidget(icon: Icons.calendar_today)),
                        ButtonWidget(
                          buttonText: Strings.signUp,
                          onPressed: () => print("s'inscrire"),),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 20
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckboxWidget(),
                      Text(
                        Strings.acceptConditions,
                        style: TextStyle(
                          fontSize: 15,
                        )
                      ),
                    ]
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Strings.alreadyAccount),
                      TextButton(
                        onPressed: () =>  Navigator.pushNamedAndRemoveUntil(
                          context,
                          SIGN_IN_PAGE,
                          (Route<dynamic> route) => false
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(" " + Strings.signIn,
                          style: MyTextStyles.bodyLink,
                        ),
                      )
                    ],
                  ),

                  Spacer(),
                ]
            ),
          ),
        )
    );
  }
}

