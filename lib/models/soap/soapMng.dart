import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:real_final/config/Oil.dart';
import 'package:real_final/models/soap/addAdditve.dart';
import 'package:real_final/models/soap/addMemo.dart';
import 'package:real_final/models/soap/addOil.dart';
import 'package:real_final/models/soap/addSuper.dart';
import 'package:real_final/models/soap/basic.dart';
import 'oilView.dart';

import 'oilShortcut.dart';

class soapMng with ChangeNotifier {
  double weight = 0;
  double super_weight = 0;
  double total_weight = 0;
  int index = 0;
  bool unit_G = true;
  TextEditingController name = TextEditingController();
  TextEditingController memo = TextEditingController();
  static const int MAX_INDEX = 4;
  bool oilPops = false;

  Map<int, oilPreview> oil_short_selected = {};
  Map<int, oilView> oil_selected = {};

  Map<int, oilPreview> super_short_selected = {};
  Map<int, oilView> super_selected = {};

  Widget curPage = basic();

  void addWeight(int idx, bool fat) {
    if(fat) {
      super_weight -= super_selected[idx]!.prevWeight;
      super_weight += super_selected[idx]!.getWeight();
      super_selected[idx]!.prevWeight = super_selected[idx]!.getWeight();
    } else {
      weight -= oil_selected[idx]!.prevWeight;
      weight += oil_selected[idx]!.getWeight();
      oil_selected[idx]!.prevWeight = oil_selected[idx]!.getWeight();
    }
    // if(fat) {
    //   super_short_selected
    // }
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
    total_weight = 0;
    weight = 0;
    super_weight = 0;
    name = TextEditingController();
    memo = TextEditingController();
    unit_G = true;
    oilPops = false;
    curPage = getCurPage();
    oil_selected = {};
    oil_short_selected = {};
    super_selected = {};
    super_short_selected = {};
  }

  Set<String> typeIcons = {
    'assets/icon/cold.svg',
    'assets/icon/hot.svg',
    'assets/icon/paste.svg',
  };

  void showSelectPop() {
    if(index == 1 || index == 2) oilPops = true;
    notifyListeners();
  }

  void disableSelectPop() {
    oilPops = false;
    notifyListeners();
  }

  void addOilContainer(Oil data) {
    if(index == 1) {
      oil_short_selected[data.index] = oilPreview(data.korean, data.index);
      oil_selected[data.index] = oilView(data);
    } else {
      super_short_selected[data.index] = oilPreview(data.korean, data.index);
      super_selected[data.index] = oilView(data);
    }
    notifyListeners();
  }

  bool checkContains(int idx) {
    if(index == 1) {
      return oil_selected.containsKey(idx);
    } else {
      return super_selected.containsKey(idx);
    }
  }

  void removeOilContainer(int index) {
    if(this.index == 1) {
      weight += oil_selected[index]!.prevWeight;
      oil_selected.remove(index);
      oil_short_selected.remove(index);
    } else {
      weight += super_selected[index]!.prevWeight;
      super_selected.remove(index);
      super_short_selected.remove(index);
    }
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
      case 2: return addSuper();
      case 3: return addAdd();
      case 4: return addMemo();
      default: return basic();
    }
  }
}