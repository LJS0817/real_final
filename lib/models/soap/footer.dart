import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';
import 'dart:developer';

class footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    final soapMng soap = Provider.of<soapMng>(context);
    return Container(
      height: 75,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: soap.index == 0 ? theme.backgroundColor : theme.soapThemeColor[0],
                borderRadius: const BorderRadius.only(topRight: Radius.circular(45)),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: theme.soapThemeColor[soap.index == 0 ? 0 : 1].withOpacity(0.4),
                  borderRadius: soap.index == 0 ? BorderRadius.circular(0) : BorderRadius.only(topRight: Radius.circular(45)),
                  splashColor: theme.soapThemeColor[soap.index == 0 ? 0 : 1].withOpacity(0.4),
                  onTap: () {
                    soap.setIndex(false, context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        soap.index == 0 ? 'assets/icon/exit.svg' :'assets/icon/arrow_left.svg' ,
                        width: soap.index == 0 ? 13 : 20,
                        height: 20,
                        color: theme.soapThemeColor[soap.index == 0 ? 0 : 1],
                      ),
                      Padding(padding: EdgeInsets.only(left: soap.index == 0 ? 10 : 0)),
                      Visibility(
                        visible: soap.index == 0,
                        child: Text(
                          "나가기",
                          style: TextStyle(
                            color: theme.soapThemeColor[0],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: soap.index > 0,
            child: Container(
              width: 90,
              height: double.infinity,
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    highlightColor: theme.soapThemeColor[0].withOpacity(0.4),
                    splashColor: theme.soapThemeColor[0].withOpacity(0.4),
                    onTap: () {
                      soap.showSelectPop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: SvgPicture.asset(
                        'assets/icon/add.svg',
                        color: theme.soapThemeColor[0],
                      ),
                    )
                ),
              ),
            ),
          ),
          Visibility(
            visible: soap.index > 0,
            child: Container(
              width: 90,
              height: double.infinity,
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    highlightColor: theme.soapThemeColor[0].withOpacity(0.4),
                    splashColor: theme.soapThemeColor[0].withOpacity(0.4),
                    onTap: () {
                      context.read<soapMng>().changeUnit();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: Icon(soap.unit_G ? Icons.change_circle : Icons.change_circle_outlined, size: 32, color: theme.soapThemeColor[0],)
                    )
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: theme.soapThemeColor[0],
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(45)),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                  highlightColor: theme.soapThemeColor[1].withOpacity(0.4),
                  splashColor: theme.soapThemeColor[1].withOpacity(0.4),
                  onTap: () {
                    log("message");
                    soap.setIndex(true, context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: soap.index == 0,
                        child: Text(
                          "    다음",
                          style: TextStyle(
                            color: theme.soapThemeColor[1],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: soap.index == 0 ? 10 : 0)),
                      SvgPicture.asset(
                        'assets/icon/arrow_right.svg',
                        width: 20,
                        height: 20,
                        color: theme.soapThemeColor[1],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}