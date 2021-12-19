import 'package:chat_app/resources/theme.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
<<<<<<< HEAD
  bool? checked;
  final ValueChanged<bool> valueChange;
  CheckboxWidget({
    Key? key,
    this.checked,
    required this.valueChange,
=======
  bool? checked = false;
  final ValueChanged<bool> valueChanged;
  CheckboxWidget({
    Key? key,
    this.checked,
    required this.valueChanged,
>>>>>>> TOS_checkbox
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
<<<<<<< HEAD
          widget.valueChange(value ?? false);
=======
          widget.valueChanged(value ?? false);
>>>>>>> TOS_checkbox
          widget.checked = value;
        });
      }
    );
  }
}