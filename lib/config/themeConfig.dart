import 'package:flutter/material.dart';

enum TYPE { E_COLD, E_HOT, E_PASTE }
enum MAINMENU_TYPE { E_SOAP, E_BEAUTY, E_OIL, E_SETTING }

final themeData theme = themeData();

class themeData {
  static const List<Color> themeColors = [
    Color(0xFF3B6C95),
    Color(0xFF8F9E81),
    Color(0xFFAC94BB),
    Color(0xFFEE9181)
  ];
  static const List<Color> themeTextColors = [
    Color(0xFFEFF1F5),
    Color(0xFFF1F5ED),
    Color(0xFFFCF8FF),
    Color(0xFFFFF6F4)
  ];
  static const List<Color> themeIconColors = [
    Color(0xFFBFE2FF),
    Color(0xFFE5F0DB),
    Color(0xFFF8EEFF),
    Color(0xFFFEE6E1),

    Color(0xFF07263F),
    Color(0xFF344127),
    Color(0xFF3B2349),
    Color(0xFF782011),
  ];
  static const List<Color> themeBackgroundColors = [
    Color(0xFFEFF1F5),
    Color(0xFFF1F5ED),
    Color(0xFFFCF8FF),
    Color(0xFFFFF6F4)
  ];

  ///테마 - 텍스트 - 강조 텍스트 - 비활성화 버튼
  static const List<List<Color>> soapThemeColors = [
    [ Color(0xFF20567A), Color(0xFFE9F6FF), Color(0xFF98D6FF), Color(0xFFA3B8C9) ],
    [ Color(0xFF4778AD), Color(0xFFB8CFE8), Color(0xFF0B3D74), Color(0xFFB2CCE9) ],
    [ Color(0xFF618EAB), Color(0xFFF0F9FF), Color(0xFF183E56), Color(0xFFBAD3E9) ],
  ];

  Color textColor = themeTextColors[0];
  Color iconColor = themeIconColors[0];
  Color backgroundColor = themeBackgroundColors[0];
  Color themeColor = themeColors[0];
  ///테마 - 텍스트 - 강조 텍스트 - 비활성화 버튼
  List<Color> soapThemeColor = soapThemeColors[0];
  TYPE type = TYPE.E_COLD;
  MAINMENU_TYPE main_type = MAINMENU_TYPE.E_SOAP;

  Color getDisableIconColor() {
    return themeIconColors[main_type.index + 4];
  }

  void soapDataInit() {
    type = TYPE.E_COLD;
    soapThemeColor = soapThemeColors[0];
  }

  void changeSoapTheme(TYPE t) {
    type = t;
    soapThemeColor = soapThemeColors[t.index];
  }

  Color getSoapType(TYPE compare, int idx, int fail) {
    return type == compare ? soapThemeColor[idx] : soapThemeColor[fail];
  }

  void changeMainTheme(MAINMENU_TYPE t) {
    main_type = t;
    themeColor = themeColors[t.index];
    textColor = themeTextColors[t.index];
    iconColor = themeIconColors[t.index];
    backgroundColor = themeBackgroundColors[t.index];
  }

  void changeTheme(TYPE t) {
    type = t;
    themeColor = themeColors[t.index];
    textColor = themeTextColors[t.index];
    iconColor = themeIconColors[t.index];
    backgroundColor = themeBackgroundColors[t.index];
  }
}