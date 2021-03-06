import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/providers/authentication_provider.dart';
import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:chat_app/utils/navigation_utils.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {

  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.alertConfirmSignOut,
          onClick: () async {
            AuthenticationProvider().signOut(context: context);
            Navigator.of(context).pop();
            //Navigator.of(context).pushNamedAndRemoveUntil(
            //    MAIN_APP,
            //    (Route<dynamic> route) => false
            //);
          }
        );
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Spacer(
                flex: 2
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.titleApp,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    IconButton(
                      onPressed: () async {
                        NavigationUtils.showMyDialog(
                            context: context,
                            bodyText: Strings.alertConfirmSignOut,
                            onClick: () async {
                              AuthenticationProvider().signOut(context: context);
                              Navigator.of(context).pop();
                            }
                        );
                      },
                      icon: IconWidget(
                        icon: Icons.power_settings_new_outlined,
                        size: 27
                      ),
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 1
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFieldWidget(
                  valueChanged: (value) {
                    _searchText = value;
                  },
                  textFieldParameters: SearchTextFieldParameters(),
                ),
              ),
              Expanded(
                flex: 17,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      onTap: () async {
                        bool _isUserStillConnected = await AuthenticationProvider().reloadFirebase(context: context);
                        if (_isUserStillConnected) {
                          Navigator.pushNamed(context, ROOM_PAGE);
                        }

                      },
                      leading: Image.asset(
                        users[index]?.imagePath ?? "assets/pp/no_photo.png"
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users[index]?.userName ?? "utilisateur inconnu",
                            style: MyTextStyles.bodyLink,
                          ),
                          Text(
                            "un message",
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 16
                            ),
                          )
                        ],
                      ),
                      trailing: Text(
                        Strings.exampleDate,
                        style: MyTextStyles.dateMessagesScreen,
                      ),
                    ),
                  );
                },
                  itemCount: users.length,
                  physics: BouncingScrollPhysics()
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(SEARCH_PAGE),
          child: Icon(
            Icons.create
          ),
        ),
      ),
    );
  }
}
