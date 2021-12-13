import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            Strings.titleApp,
            style: Theme.of(context).textTheme.headline1,
          ),
          TextFieldWidget(
            hintText: Strings.search,
            icon: IconWidget(
              icon: Icons.search
            ),
          )
        ],
      ),
    );
  }
}
