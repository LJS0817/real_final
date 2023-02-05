import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:real_final/config/Oil.dart';
import 'package:real_final/models/soap/addOil.dart';
import 'package:real_final/models/soap/basic.dart';
import 'oilView.dart';

import 'oilShortcut.dart';

class soapMng with ChangeNotifier {
  double weight = 0;
  int index = 0;
  bool unit_G = true;
  TextEditingController name = TextEditingController();
  static const int MAX_INDEX = 7;
  bool oilPops = false;

  Map<int, oilPreview> oil_short_selected = {};
  Map<int, oilView> oil_selected = {};

  Widget curPage = basic();

  void addWeight(int idx) {
    weight -= oil_selected[idx]!.prevWeight;
    weight += oil_selected[idx]!.getWeight();
    oil_selected[idx]!.prevWeight = oil_selected[idx]!.getWeight();
    oil_selected[idx]!.prevWeight = oil_selected[idx]!.getWeight();
    // if(unit_G) {
    //   oil_selected[index]!.per.text = ((weight / double.parse(oil_selected[index]!.g.value.text)) * 100).toString();
    // } else {
    //   oil_selected[index]!.g.text = (weight * double.parse(oil_selected[index]!.per.value.text) * 0.01).toString();
    // }
    notifyListeners();
  }

  void changeName() {
    notifyListeners();
  }

  void init() {
    index = 0;
    weight = 0;
    name = TextEditingController();
    unit_G = true;
    oilPops = false;
    oil_selected = {};
    curPage = getCurPage();
    oil_short_selected = {};
  }

  Set<String> typeIcons = {
    'assets/icon/cold.svg',
    'assets/icon/hot.svg',
    'assets/icon/paste.svg',
  };

  void showSelectPop() {
    if(index == 1) oilPops = true;
    notifyListeners();
  }

  void disableSelectPop() {
    oilPops = false;
    notifyListeners();
  }

  void addOilContainer(Oil data) {
    oil_short_selected[data.index] = oilPreview(data.korean, data.index);
    oil_selected[data.index] = oilView(data);
    notifyListeners();
  }

  void removeOilContainer(int index) {
    weight += oil_selected[index]!.prevWeight;
    oil_selected.remove(index);
    oil_short_selected.remove(index);
    notifyListeners();
  }

  void changeUnit() {
    unit_G = !unit_G;
    notifyListeners();
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
    curPage = getCurPage();
    notifyListeners();
  }

  Widget getCurPage() {
    switch(index) {
      case 0: return basic();
      case 1: return addOil();
      default: return basic();
    }
  }
}