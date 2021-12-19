import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  bool? checked;
  final ValueChanged<bool> valueChange;
  CheckboxWidget({
    Key? key,
    this.checked,
    required this.valueChange,
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
      onChanged: (bool? value) {
        setState(() {
          widget.valueChange(value ?? false);
          widget.checked = value;
        });
      },
    );
  }
}