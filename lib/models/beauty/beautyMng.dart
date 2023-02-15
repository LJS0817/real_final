import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:real_final/models/beauty/basic.dart';


class beautyMng with ChangeNotifier {
  Set<String> typeIcons = {
    'assets/icon/skin.svg',
    'assets/icon/essense.svg',
    'assets/icon/lotion.svg',
    'assets/icon/cream.svg',
  };

  Widget curPage = basic();
  TextEditingController name = TextEditingController();

}