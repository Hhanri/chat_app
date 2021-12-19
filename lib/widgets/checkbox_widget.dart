import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  bool? checked;
  CheckboxWidget({
    Key? key,
    this.checked,
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
        value: widget.checked,
        onChanged: (value) {
          setState(() {
            widget.checked = value;
            print("TOScheck is ${widget.checked}");
          });
        }
    );
  }
}