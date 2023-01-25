import 'package:flutter/cupertino.dart';
import 'package:real_final/models/soap/addOil.dart';
import 'package:real_final/models/soap/basic.dart';

import 'oilShortcut.dart';

final soapMng soap = soapMng();

class soapMng {
  int index = 0;
  TextEditingController name = TextEditingController();
  late Function Update;
  static const int MAX_INDEX = 7;
  bool oilPops = false;

  Map<int, oilPreview> oil_selected = {};

  void init(Function func) {
    index = 0;
    name = TextEditingController();
    Update = func;
    oilPops = false;
    oil_selected = {};
  }

  Set<String> typeIcons = {
    'assets/icon/cold.svg',
    'assets/icon/hot.svg',
    'assets/icon/paste.svg',
  };

  void showSelectPop() {
    if(index == 1) oilPops = true;
  }

  void setIndex(bool increase, BuildContext context) {
    index = increase ? index + 1 : index - 1;
    if(index < 0) {
      index = 0;
      Navigator.of(context).pop();
    }
    if(index > MAX_INDEX) {
      index = MAX_INDEX;
    }
  }

  Widget curPage() {
    switch(index) {
      case 0: return basic();
      case 1: return addOil();
      default: return basic();
    }
  }
}