import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TYPE { E_COLD, E_HOT, E_PASTE, E_SKIN, E_LOTION, E_ESSENSE, E_CREAM, E_ETC }
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
  static const List<List<Color>> workspaceThemeColors = [
    [ Color(0xFF20567A), Color(0xFFE9F6FF), Color(0xFF98D6FF), Color(0xFFA3B8C9) ],
    [ Color(0xFF4778AD), Color(0xFFB8CFE8), Color(0xFF0B3D74), Color(0xFFB2CCE9) ],
    //[ Color(0xFF618EAB), Color(0xFFF0F9FF), Color(0xFF183E56), Color(0xFFBAD3E9) ],
    [ Color(0xFF7DB3C3), Color(0xFFDBE9F8), Color(0xFF0E4178), Color(0xFFBED7ED) ],

    [ Color(0xFFF2DFB4), Color(0xFFC3A86A), Color(0xFF7E5C0D), Color(0xFFFDF7E9) ],
    [ Color(0xFFC2BC83), Color(0xFF77702C), Color(0xFF364301), Color(0xFFFFFDEB) ],
    [ Color(0xFFB49577), Color(0xFF62503D), Color(0xFF643605), Color(0xFFFDF6EF) ],
    [ Color(0xFF9ECCB6), Color(0xFF407159), Color(0xFF073A21), Color(0xFFE1FFF0) ],
  ];

  // ///테마 - 텍스트 - 강조 텍스트 - 활성 텍스트
  // static const List<List<Color>> beautyThemeColors = [
  //   [ Color(0xFFF2DFB4), Color(0xFFC3A86A), Color(0xFF7E5C0D), Color(0xFFFDF7E9) ],
  //   [ Color(0xFFC2BC83), Color(0xFF77702C), Color(0xFF364301), Color(0xFFFFFDEB) ],
  //   [ Color(0xFFB49577), Color(0xFF62503D), Color(0xFF643605), Color(0xFFFDF6EF) ],
  //   [ Color(0xFF9ECCB6), Color(0xFF407159), Color(0xFF073A21), Color(0xFFE1FFF0) ],
  // ];

  Color textColor = themeTextColors[0];
  Color disableIconColor = themeIconColors[4];
  Color iconColor = themeIconColors[0];
  Color backgroundColor = themeBackgroundColors[0];
  Color themeColor = themeColors[0];
  ///테마 - 텍스트 - 강조 텍스트 - 비활성화 버튼
  List<Color> workspaceThemeColor = workspaceThemeColors[0];
  TYPE type = TYPE.E_COLD;
  MAINMENU_TYPE main_type = MAINMENU_TYPE.E_SOAP;


  void init(int idx) {
    if(idx == 0) {
      type = TYPE.E_COLD;
    } else {
      type = TYPE.E_SKIN;
    }
    workspaceThemeColor = workspaceThemeColors[type.index];
  }

  int getType() {
    return type.index > TYPE.E_PASTE.index ? type.index - 3 : type.index;
  }

  Color getThemeColor(int i, {int data = -1}) {
    return workspaceThemeColors[data == -1 ? type.index : data][i];
  }

  void changeWorkspaceTheme(TYPE t) {
    type = t;
    workspaceThemeColor = workspaceThemeColors[t.index];
    notifyListeners();
  }

  Color getTypeColor(TYPE compare, int idx, int fail) {
    return type == compare ? workspaceThemeColor[idx] : workspaceThemeColor[fail];
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
