
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_final/config/Oil.dart';
import 'package:real_final/config/Mng.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';

class oilPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: soap.oilPops,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Container(
            color: CupertinoColors.black.withOpacity(0.7),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: theme.backgroundColor,
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          "오일 선택",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: theme.themeColor),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 16)),
                        Expanded(
                          child: ListView(
                            children: mng.oils.values.toList(),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 14)),
                        Container(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: soap.oil_selected.values.toList(),
                          ),
                        ),
                        Container(
                          height: 70,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 10,
                        right: 20,
                        child: Container(
                          width: 40,
                          height: 25,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                soap.oilPops = false;
                                soap.Update();
                              },
                              child: Text("확인", style: TextStyle(color: theme.soapThemeColor[0], fontSize: 16, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
            )
        ),
      )
    );
  }
}
