import 'package:chat_app/providers/authentication_provider.dart';
import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:chat_app/utils/app_config.dart';
import 'package:chat_app/utils/navigation_utils.dart';
import 'package:chat_app/widgets/button_widget.dart';
import 'package:chat_app/widgets/checkbox_widget.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _username = "";
  String _birthDate = "";
  bool? _TOScheck = false;

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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldWidget(
                            valueChanged: (value) {
                              _email = value;
                            },
                            textFieldParameters: EmailTextFieldParameters(),
                          ),
                          TextFieldWidget(
                            valueChanged: (value) {
                              _password = value;
                            },
                            textFieldParameters: PasswordTextFieldParameters(),
                          ),
                          TextFieldWidget(
                            valueChanged: (value) {
                              _username = value;
                            },
                            textFieldParameters: NameTextFieldParameters(),
                          ),
                          TextFieldWidget(
                            valueChanged: (value) {
                              _birthDate = value;
                              print("$_birthDate");
                            },
                            textFieldParameters: DateTextFieldParameters(
                              hintText: Strings.birthday,
                              iconWidget: IconWidget(icon: Icons.calendar_today)
                            ),
                          ),
                          ButtonWidget(
                            buttonText: Strings.signUp,
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_TOScheck == true) {
                                if (_formKey.currentState!.validate()) {
                                  AuthenticationProvider().signUp(
                                      email: _email,
                                      password: _password,
                                      username: _username,
                                      context: context
                                  );
                                }
                              } else {
                                NavigationUtils.showMyDialog(
                                  context: context,
                                  bodyText: Strings.errorTOSNotChecked
                                );
                              }
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 20
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckboxWidget(
                        checked: _TOScheck,
                        valueChanged: (value) {
                          _TOScheck = value;
                        },
                      ),
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

