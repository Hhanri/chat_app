import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final String hintText;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: MyShapes.circularBorders,
        color: MyColors.containerColor,
      ),
      constraints: BoxConstraints(
        minHeight: MySizes.minimumHeightInput,
      ),
      child: TextField(
          decoration: InputDecoration(
            fillColor: MyColors.containerColor,
            hintText: hintText,
            hintStyle: MyTextStyles.buttonPlaceHolder,
            contentPadding: EdgeInsets.symmetric(horizontal: 21),
            border: InputBorder.none,
          )
      ),
    );
  }
}