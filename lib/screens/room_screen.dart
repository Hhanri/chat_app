import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/providers/authentication_provider.dart';
import 'package:chat_app/providers/chat_provider.dart';
import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:chat_app/widgets/message_container_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/utils/format_util.dart';

class RoomScreen extends StatefulWidget {
  final dynamic peerUserArgument;
  const RoomScreen({Key? key,
    required this.peerUserArgument}) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {

  String _message = "";
  UserModel? _peerUser;
  TextEditingController?  _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _peerUser = widget.peerUserArgument;
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
          _peerUser?.userName ?? Strings.nullSafetyUnknownUser,
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
            child: Image.asset(_peerUser?.imagePath ?? "assets/pp/no_photo.png"),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: StreamBuilder<QuerySnapshot<dynamic>>(
              stream: ChatProvider.getRoomMessages(
                peerId: _peerUser?.userId ?? UniqueKey().toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  if (snapshot.hasData) {
                    List<QueryDocumentSnapshot<dynamic>> _docs = snapshot.data!.docs;
                    List<MessageModel?> _messageModel = MessageModel.decodeMessages(_docs);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                      child: (_messageModel.length > 0)
                      ? ListView.builder(
                          reverse: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: _messageModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: (_messageModel[index]?.userId == AuthenticationProvider().currentUser?.uid
                                                    ? CrossAxisAlignment.end
                                                    : CrossAxisAlignment.start
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: Text(
                                      _messageModel[index]?.timeMessage.parseDataToStringMessages() ?? "",
                                      style: MyTextStyles.dateChatScreen,
                                    ),
                                  ),
                                  MessageContainerWidget(
                                    text: _messageModel[index]?.textMessage ?? "",
                                    isCurrentUser: (_messageModel[index]?.userId == AuthenticationProvider().currentUser?.uid)
                                                    ? true
                                                    : false,
                                  )
                                ],
                              ),
                            );
                          }
                        )
                      : Center(
                        child: Text(
                          Strings.brandNewConv + (_peerUser?.userName ?? "cette personne").toString()
                        )
                      ),
                    );

                  } else {
                    return Center(
                      child: Text(
                        Strings.getMessageError,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                }
              }
            ),
          ),
          Container(
            height: 80,
            child: Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 18,
                  child: TextFieldWidget(
                    valueChanged: (value) {
                      _message = value;
                    },
                    textEditingController: _textEditingController,
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
                      onPressed: () {
                        ChatProvider.setMessage(
                          peerId: _peerUser?.userId ?? UniqueKey().toString(),
                          message: _message
                        );
                        setState(() {
                          _textEditingController?.clear();
                        });
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
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
            height: 15
          )
        ],
      ),
    );
  }
}

