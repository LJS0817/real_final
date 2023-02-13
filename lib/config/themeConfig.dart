import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TYPE { E_COLD, E_HOT, E_PASTE, E_SKIN, E_ESSENSE, E_LOTION, E_CREAM }
enum MAINMENU_TYPE { E_SOAP, E_BEAUTY, E_OIL, E_SETTING }

class themeData with ChangeNotifier {
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
    // [ Color(0xFFB8CFE8), Color(0xFF4778AD), Color(0xFF0E4178), Color(0xFF75929F) ],
  ];

  ///테마 - 텍스트 - 강조 텍스트 - 비활성화 버튼
  static const List<List<Color>> beautyThemeColors = [
    [ Color(0xFFF2DFB4), Color(0xFF7C6348), Color(0xFF643605), Color(0xFFA3B8C9) ],
    [ Color(0xFFEAB57D), Color(0xFF7C6348), Color(0xFF643605), Color(0xFFB2CCE9) ],
    [ Color(0xFFB49577), Color(0xFFFDF9F5), Color(0xFF463A2E), Color(0xFFBAD3E9) ],
    [ Color(0xFF908271), Color(0xFFFBF7F2), Color(0xFF2E1901), Color(0xFFBAD3E9) ],
  ];

  Color textColor = themeTextColors[0];
  Color disableIconColor = themeIconColors[5];
  Color iconColor = themeIconColors[0];
  Color backgroundColor = themeBackgroundColors[0];
  Color themeColor = themeColors[0];
  ///테마 - 텍스트 - 강조 텍스트 - 비활성화 버튼
  List<Color> soapThemeColor = soapThemeColors[0];
  TYPE type = TYPE.E_COLD;
  MAINMENU_TYPE main_type = MAINMENU_TYPE.E_SOAP;

  void soapDataInit() {
    type = TYPE.E_COLD;
    soapThemeColor = soapThemeColors[0];
  }

  void changeSoapTheme(TYPE t) {
    type = t;
    soapThemeColor = soapThemeColors[t.index];
    notifyListeners();
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
    disableIconColor = themeIconColors[t.index + 4];
    notifyListeners();
  }
}