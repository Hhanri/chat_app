import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class MessageContainerWidget extends StatelessWidget {

  final bool isCurrentUser;
  final String text;

  const MessageContainerWidget({
    Key? key,
    required this.isCurrentUser,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: isCurrentUser ? MyShapes.radiusCircular : MyShapes.radiusCircularZero,
          topRight: isCurrentUser ? MyShapes.radiusCircularZero : MyShapes.radiusCircular,
          bottomLeft: Radius.circular(38),
          bottomRight: Radius.circular(38),
        ),
        color: isCurrentUser ? Theme.of(context).primaryColor : MyColors.containerColor,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                color: const Color(0x29000000),
                offset: Offset(0,3),
                blurRadius: 4,
              )
            ]
        ),
      ),
    );
  }
}