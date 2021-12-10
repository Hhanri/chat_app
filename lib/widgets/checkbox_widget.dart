import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(
            borderRadius: MyShapes.checkboxBorders
        ),
        value: false,
        onChanged: (value) {
          setState(() {
            value = value;
          });
        }
    );
  }
}