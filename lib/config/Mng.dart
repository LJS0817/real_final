import 'package:flutter/cupertino.dart';
import 'package:real_final/models/index/oilContainer.dart';
import 'Oil.dart';

final Mng mng = Mng();

class Mng {
  bool isWorkspace = false;
  Map<int, oilContainer> oils = {};
  Map<int, oilContainer> marked_oils = {};
}