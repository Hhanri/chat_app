import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/resources/theme.dart';
import 'package:chat_app/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {

  final TextFieldParamaters textFieldParameters;

  const TextFieldWidget({
    Key? key,
    required this.textFieldParameters,
  }) :  super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  late final TextFieldParamaters _textFieldParamaters;

  @override
  void initState() {
    super.initState();
    _textFieldParamaters = widget.textFieldParameters;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}


class TextFieldParamaters {
  final String? hintText;
  IconWidget? iconWidget;
  VoidCallback? iconTap;
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
    this.keyboardType
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