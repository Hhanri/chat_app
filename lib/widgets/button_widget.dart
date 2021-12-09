import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  final String buttonText;

  const ButtonWidget({Key? key,
    required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MySizes.minimumHeightInput,
      ),
      decoration: BoxDecoration(
        borderRadius: MyShapes.circularBorders,
        color: MyColors.primary
      ),
      child: Text(
        buttonText
      )
    );
  }
}
