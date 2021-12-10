import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final IconData icon;

  const IconWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 33,
      color: MyColors.iconColor
    );
  }
}