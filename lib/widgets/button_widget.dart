import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  final String buttonText;
  final VoidCallback onPressed;

  const ButtonWidget({Key? key,
    required this.buttonText,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
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
      ),
      onPressed: () => onPressed(),
    );
  }
}
