import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final String hintText;
  final IconWidget? icon;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: MyShapes.circularBorders,
        color: MyColors.containerColor,
      ),
      constraints: BoxConstraints(
        minHeight: MySizes.minimumHeightInput,
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: MyColors.containerColor,
          hintText: hintText,
          hintStyle: MyTextStyles.buttonPlaceHolder,
          contentPadding: EdgeInsets.symmetric(horizontal: 21),
          border: InputBorder.none,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 21.0),
            child: icon,
          )
        )
      ),
    );
  }
}
