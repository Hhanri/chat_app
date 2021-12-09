import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: 'Sana',
  primaryColor: MyColors.primary,
  scaffoldBackgroundColor: MyColors.backgroundPage,
  appBarTheme: AppBarTheme(
    backgroundColor: MyColors.containerColor
  ),
  textTheme: TextTheme(
    headline1: MyTextStyles.title1,
    bodyText1: MyTextStyles.body,
    bodyText2: MyTextStyles.body
  ),
  hoverColor: MyColors.hover,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: MyColors.iconColor
  ),
  buttonColor: MyColors.primary
);

class MyColors {
  static const Color backgroundPage = const Color(0xff282828);
  static const Color primary = const Color(0xff46e288);
  static const Color hover = const Color(0xff00e25e);
  static const Color containerColor = const Color(0xff474747);
  static const Color bodyText = const Color(0xffc4c4c4);
  static const Color iconColor = Color.fromRGBO(0,0,0,0.34);
}

class MyTextStyles {

  static const TextStyle title1 = const TextStyle(
    fontFamily: 'PureBold',
    fontSize: 40,
    color: const Color(0xffffffff),
    letterSpacing: 1.5,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle body = const TextStyle(
    fontFamily: 'Sana',
    fontSize: 18,
    color: MyColors.bodyText,
  );

  static const TextStyle buttonPlaceHolder = const TextStyle(
    fontFamily: 'Sana',
    fontSize: 21,
    color: const Color(0xff898989),
    shadows: [
      Shadow(
        color: const Color(0x29000000),
        offset: Offset(0,3),
        blurRadius: 6,
      )
    ]
  );

  static const TextStyle bodyLink = const TextStyle(
    fontFamily: 'Sana',
    fontSize: 18,
    color: MyColors.primary,
  );

  static const TextStyle date = const TextStyle(
    fontFamily: 'Hiragino Sans',
    fontSize: 8,
    color: const Color(0xff717171)
  );
}

class MyShapes {

  static BorderRadiusGeometry circularBorders = BorderRadius.circular(38.0);

}

class MySizes {
  static double minimumHeightInput = 50;
}