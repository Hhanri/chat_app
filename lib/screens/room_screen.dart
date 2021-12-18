import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:chat_app/widgets/message_container_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
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
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 18,
                  child: TextFieldWidget(
                    textFieldParameters: TextFieldParamaters(
                      hintText: Strings.tapMessage,
                      iconWidget: IconWidget(icon: Icons.camera_alt_rounded),
                      textStyle: MyTextStyles.formPlaceHolder.copyWith(
                        fontSize: 18
                      ),
                    ),
                  )
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.send_sharp),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap
                      ),
                    ),
                  )
                ),
                Spacer()
              ],
            ),
          ),
          SizedBox(
            height: 20
          )
        ],
      ),
    );
  }
}

