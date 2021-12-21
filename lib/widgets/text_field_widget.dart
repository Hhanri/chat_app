import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_app/utils/format_util.dart';

class TextFieldWidget extends StatefulWidget {

  final ValueChanged<String> valueChanged;
  final TextFieldParamaters textFieldParameters;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;

  const TextFieldWidget({
    Key? key,
    required this.textFieldParameters,
    required this.valueChanged,
    this.focusNode,
    this.textEditingController,
  }) :  super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  late final TextFieldParamaters _textFieldParamaters;
  FocusNode? _focusNode;
  TextEditingController? _textEditingController;


  @override
  void initState() {
    super.initState();
    _textFieldParamaters = widget.textFieldParameters;
    _focusNode = widget.focusNode ?? FocusNode();
    _textEditingController = widget.textEditingController ?? TextEditingController();
    if (_textFieldParamaters is PasswordTextFieldParameters) {
      _textFieldParamaters.iconTap = _revealObscureText;
    }
    if (_textFieldParamaters is DateTextFieldParameters) {
      _textFieldParamaters.iconTap = () {
        FocusScope.of(context).requestFocus(FocusNode());
        _pickDate().then((value) {
          widget.valueChanged(value);
        });
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      focusNode: _focusNode,
      style: MyTextStyles.body,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: _textFieldParamaters.hintText,
        hintStyle: _textFieldParamaters.textStyle ?? MyTextStyles.formPlaceHolder,
        suffixIcon: GestureDetector(
          onTap: _textFieldParamaters.iconTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 21.0),
            child:
            (_textFieldParamaters is PasswordTextFieldParameters)
              ?  (_textFieldParamaters.obscureText)
                ? IconWidget(icon: Icons.visibility)
                : IconWidget(icon: Icons.visibility_off)
              :_textFieldParamaters.iconWidget,
          ),
        )
      ),
      obscureText: _textFieldParamaters.obscureText,
      autocorrect: _textFieldParamaters.autoCorrect,
      onChanged: (String? value) {
        widget.valueChanged(value ?? "");
      },
      onFieldSubmitted: (String? value) {
        widget.valueChanged(value ?? "");
      },
      validator: (String? value) {
        return _validateForm(value ?? "");
      },
    );
  }

  void _revealObscureText() {
    setState(() {
      _textFieldParamaters.obscureText = !_textFieldParamaters.obscureText;
    });
  }

  Future<String> _pickDate() async {
    DateTime? _picked = DateTime(2000);
    _picked = await showDatePicker(
      context: context,
      initialDate: _picked,
      firstDate: DateTime(1900),
      lastDate: DateTime.now()
    );
    if(_picked != null) {
      setState(() => _textEditingController?.text = _picked.toString());
    }
    return _picked.toString();
  }




  String? _validateForm(String value) {
    if (_textFieldParamaters != SearchTextFieldParameters) {
      if (value == "" || value.replaceAll(" ", "") == "") {
        return Strings.errorEmptyField;
      } else {
        if (_textFieldParamaters is PasswordTextFieldParameters && value.length < 8) {
          return Strings.errorPasswordLength;
        }
      }
    }
    if (_textFieldParamaters is EmailTextFieldParameters) {
      if(!value.isValidEmail()) {
        return Strings.errorIsNotEmail;
      }
    }
    widget.valueChanged(value);
    return null;
  }
}


class TextFieldParamaters {
  final String? hintText;
  IconWidget? iconWidget;
  VoidCallback? iconTap;
  VoidCallback? onTap;
  final TextStyle? textStyle;
  bool obscureText;
  final bool autoCorrect;
  List<TextInputFormatter>? textInputFormatters;
  TextInputType? keyboardType;

  TextFieldParamaters({
    required this.hintText,
    this.iconWidget,
    this.iconTap,
    this.textStyle,
    this.obscureText = false,
    this.autoCorrect = true ,
    this.textInputFormatters,
    this.keyboardType,
    this.onTap
  });
}

class NameTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  NameTextFieldParameters({
    this.hintText = Strings.name
  }) : super(
    hintText: hintText,
    textInputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
    keyboardType: TextInputType.name
  );
}

class EmailTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  EmailTextFieldParameters({
    this.hintText = Strings.email
  }) : super(
      hintText: hintText,
      keyboardType: TextInputType.emailAddress
  );
}

class PasswordTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  final IconWidget? iconWidget;
  PasswordTextFieldParameters({
    this.hintText = Strings.password,
    this.iconWidget = const IconWidget(
      icon: Icons.visibility
    )
  }) : super(
    hintText: hintText,
    obscureText: true,
    autoCorrect: false,
    iconWidget: iconWidget
  );
}

class DateTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  final IconWidget? iconWidget;
  DateTextFieldParameters({
    this.hintText = Strings.birthday,
    this.iconWidget = const IconWidget(
        icon: Icons.calendar_today
    )
  }) : super(
      hintText: hintText,
      autoCorrect: false,
      iconWidget: iconWidget
  );
}

class SearchTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  final IconWidget? iconWidget;
  SearchTextFieldParameters({
    this.hintText = Strings.search,
    this.iconWidget = const IconWidget(
      icon: Icons.search
    )
  }) : super(
    hintText: hintText,
    iconWidget: iconWidget
  );
}