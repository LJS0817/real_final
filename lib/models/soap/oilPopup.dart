
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/Oil.dart';
import 'package:real_final/config/Mng.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';

class oilPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    final soapMng soap = Provider.of<soapMng>(context);
    final Mng mng = Provider.of<Mng>(context);
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
                          words.getText(6),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: theme.getThemeColor(0)),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 16)),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Visibility(
                                visible: mng.custom.isNotEmpty,
                                child: Column(
                                  children: [
                                    Text("사용자 오일"),
                                    const Padding(padding: EdgeInsets.only(top: 10),),
                                    Column(
                                      children: mng.custom.values.toList(),
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 20),),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: mng.marked.isNotEmpty,
                                child: Column(
                                  children: [
                                    Text("즐겨찾기", style: TextStyle(color: theme.getThemeColor(0), fontSize: 16, fontWeight: FontWeight.bold),),
                                    const Padding(padding: EdgeInsets.only(top: 10),),
                                    Column(
                                      children: mng.marked.values.toList(),
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 20),),
                                  ],
                                ),
                              ),
                              Column(
                                children: Mng.oils.values.toList(),
                              )
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 14)),
                        Container(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: soap.index == 1 ? soap.oil_short_selected.values.toList() : soap.super_short_selected.values.toList(),
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
                                soap.disableSelectPop();
                              },
                              child: Text(words.getText(7), style: TextStyle(color: theme.getThemeColor(0), fontSize: 16, fontWeight: FontWeight.bold),),
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
