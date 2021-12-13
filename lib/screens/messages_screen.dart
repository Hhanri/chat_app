import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Spacer(
              flex: 2
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.titleApp,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Spacer(
              flex: 1
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFieldWidget(
                hintText: Strings.search,
                password: false,
                icon: IconWidget(
                  icon: Icons.search
                ),
              ),
            ),
            Expanded(
              flex: 17,
              child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
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
    );
  }
}
