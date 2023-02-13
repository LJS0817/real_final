import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:real_final/config/data.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/index/beautyDataContainer.dart';
import 'package:real_final/models/index/oilContainer.dart';
import 'Oil.dart';
import 'package:real_final/models/index/soapDataContainer.dart';

class Mng with ChangeNotifier {
  bool isWorkspace = false;
  static SplayTreeMap<int, oilContainer> oils = SplayTreeMap<int, oilContainer>();
  SplayTreeMap<int, oilContainer> marked_oils = SplayTreeMap<int, oilContainer>();
  SplayTreeMap<int, oilContainer> user_oils = SplayTreeMap<int, oilContainer>();
  SplayTreeMap<int, oilContainer> get Oils => oils;
  SplayTreeMap<int, oilContainer> get marked => marked_oils;
  SplayTreeMap<int, oilContainer> get custom => user_oils;

  List<soapContainer> soapSaves = [
    soapContainer(Data(TYPE.E_COLD)),
    soapContainer(Data(TYPE.E_HOT)),
    soapContainer(Data(TYPE.E_PASTE)),
  ];

  List<beautyContainer> beautySaves = [
    beautyContainer(Data(TYPE.E_SKIN)),
    beautyContainer(Data(TYPE.E_ESSENSE)),
    beautyContainer(Data(TYPE.E_LOTION)),
    beautyContainer(Data(TYPE.E_CREAM)),
  ];

  void MarkOil(Oil data) {
    int idx = data.index - 1;
    if(data.marked) {
      marked_oils[idx] = oils[idx]!;
      oils.remove(idx);
    } else {
      oils[idx] = marked_oils[idx]!;
      marked_oils.remove(idx);
    }
    notifyListeners();
  }

  void changeSpace(bool b) {
    isWorkspace = b;
    notifyListeners();
  }

  void saveSoap(soapContainer sc) {
    soapSaves.add(sc);
    notifyListeners();
  }

  void saveBeauty(beautyContainer bc) {
    beautySaves.add(bc);
    notifyListeners();
  }

  static void addOil(Oil data) {
    oils[data.index] = oilContainer(data);
  }
}