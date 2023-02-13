import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/Mng.dart';
import 'package:real_final/config/menuMng.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/models/index/bottomNavigationBar.dart';
import 'package:real_final/screens/menu/beauty.dart';
import 'package:real_final/screens/menu/oil.dart';
import 'package:real_final/screens/menu/setting.dart';
import 'package:real_final/screens/menu/soap.dart';

import '../../config/Oil.dart';
import '../../models/index/oilContainer.dart';


class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

void loadAsset(BuildContext context) async {
  String s = await DefaultAssetBundle.of(context).loadString('assets/data.csv');
  List<String> list = s.split('\n');
  List<String> data = [];
  late Oil oil;
  for(int i = 0; i < list.length; i++) {
    try{
      data = list[i].split(',');
      oil = Oil(index: int.parse(data[0]), korean: data[1], english: data[2], NaOH: double.parse(data[3]),
          KOH: double.parse(data[4]), fat: List.generate(FAT_TYPE.LENGTH.index,
                  (index) => double.tryParse(data[index + 5]) ?? 0.0));
      list = s.split('\n');
      Mng.oils[i] = oilContainer(oil);
    } catch(ex) {
      log("ERROR : $ex");
    }
  }
  //index,korean,english,NaOH,KOH,Lauric,Myristic,
  //Palmitic,Stearic,Palmitoleic,Ricinoleic,Oleic,Linoleic,Linolenic
}

Widget getIndex() {
  if(menu.index == 0) { return SoapTab(); }
  if(menu.index == 1) { return BeautyTab(); }
  if(menu.index == 2) { return OilTab(); }
  else { return SettingTab(); }
}

class _IndexScreenState extends State<IndexScreen> {

  @override
  void initState() {
    words.init();
    menu.init(() { setState(() {  }); });
    super.initState();
    loadAsset(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.read<themeData>().backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.read<themeData>().themeColor,
        title: Text(words.getMainTitle(menu.index)),
      ),
      body: getIndex(),
      bottomNavigationBar: bottomNavigationBar((int idx) { menu.index = idx; }),
    );
  }
}