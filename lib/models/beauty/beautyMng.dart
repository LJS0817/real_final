import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:real_final/models/beauty/basic.dart';
import 'package:real_final/models/beauty/selectType.dart';

enum SKIN_TYPE {
  E_SENSITIVE,
  E_DRY,
  E_ILL,
  E_MIXED,
  E_OILY,
  E_ACNE
}

class beautyMng with ChangeNotifier {
  Set<String> typeIcons = {
    'assets/icon/skin.svg',
    'assets/icon/essense.svg',
    'assets/icon/lotion.svg',
    'assets/icon/cream.svg',
  };

  Widget curPage = basic();
  TextEditingController name = TextEditingController();
  SKIN_TYPE type = SKIN_TYPE.E_SENSITIVE;
  int index = 0;
  final int MAX_INDEX = 2;


  void setIndex(bool increase, BuildContext context) {
    index = increase ? index + 1 : index - 1;
    if(index < 0) {
      index = 0;
      Navigator.of(context).pop();
    }
    if(index > MAX_INDEX) {
      index = MAX_INDEX;
    }
    curPage = getCurPage();
    notifyListeners();
  }

  void setSkinType(SKIN_TYPE t) {
    type = t;
    notifyListeners();
  }


  Widget getCurPage() {
    switch(index) {
      case 0: return basic();
      case 1: return selectType();
      default: return basic();
    }
  }
}