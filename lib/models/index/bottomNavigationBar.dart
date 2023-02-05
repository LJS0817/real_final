import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/Mng.dart';
import 'package:real_final/config/menuMng.dart';
import 'package:real_final/config/themeConfig.dart';

import '../soap/soapMng.dart';

const double iconScale = 29;

class iconButton extends StatelessWidget {
  late String _src;
  late Function _func;
  late int _index;
  late double scale;

  iconButton(String s, int idx, Function f, {double size = 15}) {
    _src = s;
    _index = idx;
    _func = f;
    scale = size;
  }

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    return AnimatedContainer(
        duration: Duration(milliseconds: menu.aniTime),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: theme.themeColor,
          borderRadius: BorderRadius.circular(500),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(500),
              splashColor: theme.backgroundColor.withOpacity(0.2),
              highlightColor: theme.backgroundColor.withOpacity(0.5),
              onTap: () {
                _func();
                menu.Update();
              },
              child: Container(
                padding: EdgeInsets.all(scale),
                child: SvgPicture.asset(
                  _src,
                  width: scale,
                  height: scale,
                  color: menu.index == _index ? theme.iconColor : theme.getDisableIconColor(),
                ),
              )
          ),
        )
    );
  }
}

class bottomNavigationBar extends StatelessWidget {
  late Function changeTab;

  bottomNavigationBar(Function fn, {super.key}) {
    changeTab = fn;
  }

  void changeTheme(int idx, BuildContext context) {
    if(idx == 3) { menu.isConfig = true; }
    else { menu.isConfig = false; }
    context.read<themeData>().changeMainTheme(MAINMENU_TYPE.values[idx]);
    changeTab(idx);
  }

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: menu.aniTime),
                  width: width * 0.421,
                  height: 70,
                  decoration: BoxDecoration(
                    color: theme.themeColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(47),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 31)),
                AnimatedContainer(
                  duration: Duration(milliseconds: menu.aniTime),
                  width: width * 0.42,
                  height: 70,
                  decoration: BoxDecoration(
                    color: theme.themeColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(47),
                    ),
                  ),
                ),
              ],
            )
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: menu.aniTime),
              width: 90,
              height: 41,
              color: theme.themeColor,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconButton('assets/icon/soap.svg', 0, () { changeTheme(0, context); }),
                  iconButton('assets/icon/beauty.svg', 1, () { changeTheme(1, context); }),
                  const SizedBox(width: 82, height: 80,),
                  iconButton('assets/icon/oil.svg', 2, () { changeTheme(2, context); }, size: 16),
                  iconButton('assets/icon/settings.svg', 3, () { changeTheme(3, context); }),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 21,
            child: AnimatedContainer(
              duration: Duration(milliseconds: menu.aniTime),
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 35,
              child: Material(
                borderRadius: BorderRadius.circular(500),
                color: theme.themeColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(500),
                  splashColor: theme.backgroundColor.withOpacity(0.2),
                  highlightColor: theme.backgroundColor.withOpacity(0.5),
                  onTap: () {
                    mng.isWorkspace = true;
                    context.read<soapMng>().init();
                    context.read<themeData>().soapDataInit();
                    menu.changeScene(context);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: menu.aniTime),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500.0),
                        border: Border.all(
                            strokeAlign: StrokeAlign.outside,
                            width: 4,
                            color: theme.themeColor.withOpacity(0.36)
                        )
                    ),
                    child: menu.isConfig ? SvgPicture.asset(
                      'assets/icon/save.svg',
                      width: iconScale,
                      height: iconScale,
                      color: theme.iconColor,
                      fit: BoxFit.none,) : Icon(
                      Icons.add_rounded,
                      size: 30,
                      color: theme.iconColor,
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}