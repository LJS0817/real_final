import 'package:flutter/cupertino.dart';

final menuMng menu = menuMng();

class menuMng {
  int index = 0;
  bool isConfig = false;
  final int aniTime = 240;
  late Function Update;

  final List<String> Workspaces = [
    '/work/soap',
    '/work/beauty'
  ];

  void init(Function func) {
    index = 0;
    isConfig = false;
    Update = func;
  }

  void changeScene(BuildContext context) {
    Navigator.pushNamed(context, Workspaces[index]);
  }
}