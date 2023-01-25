import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_final/config/Mng.dart';
import 'package:real_final/config/Oil.dart';
import 'package:real_final/config/menuMng.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/oilShortcut.dart';
import 'package:real_final/models/soap/soapMng.dart';

class oilContainer extends StatelessWidget {
  late Oil data;
  bool marked = false;

  oilContainer(Oil oil, {super.key}) {
    data = oil;
  }

  String getIcon() {
    return data.marked ? "assets/icon/star_filled.svg" : "assets/icon/star.svg";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: mng.isWorkspace ? theme.soapThemeColor[0] : theme.themeColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: theme.soapThemeColor[2].withOpacity(0.6),
          highlightColor: theme.soapThemeColor[2].withOpacity(0.6),
          onTap: () {
            if(!mng.isWorkspace) {
              return;
            }
            if(soap.oil_selected.containsKey(data.index))  {
              soap.oil_selected.remove(data.index);
            } else {
              soap.oil_selected[data.index] = oilPreview(data.korean, data.index);
            }
            soap.Update();
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: 20,
                child: Text(
                  data.getName(),
                  style: TextStyle(
                    color:  mng.isWorkspace ? theme.soapThemeColor[1] : theme.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                  width: 35,
                  height: 35,
                  right: 10,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      splashColor: theme.themeColor,
                      highlightColor: theme.getDisableIconColor(),
                      onTap: () {
                        data.marked = !data.marked;
                        menu.Update();
                      },
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: SvgPicture.asset(
                          getIcon(),
                          width: 25,
                          height: 25,
                          fit: BoxFit.none,
                          color: theme.textColor,
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}
