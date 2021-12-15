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

  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(
            borderRadius: MyShapes.checkboxBorders
        ),
        value: checked,
        onChanged: (value) {
          setState(() {
            this.checked = value;
          });
        }
    );
  }
}