import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/widgets/message_container_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white
        ),
        title: Text(
          "Emma",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Image.asset("assets/pp/Emma.png"),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              crossAxisAlignment: (index%2 == 0) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    Strings.exampleDate,
                    style: MyTextStyles.dateChatScreen,
                  ),
                ),
                MessageContainerWidget(isCurrentUser: (index%2 == 0) ? true : false),
              ],
            ),
          );
        }
      ),
    );
  }
}

