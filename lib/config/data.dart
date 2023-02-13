import 'package:real_final/config/themeConfig.dart';

class Data {
  List<int> oil_index = [];
  List<int> super_index = [];
  String memo = "";
  TYPE type = TYPE.E_COLD;

  Data(TYPE t) {
    type = t;
  }
}