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
    bool getIndex = soap.index == 0 || soap.index == soapMng.MAX_INDEX;
    return Container(
      height: 75,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: getIndex ? theme.backgroundColor : theme.getThemeColor(0),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(45)),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: theme.getThemeColor(getIndex ? 0 : 1).withOpacity(0.4),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(45)),
                  splashColor: theme.getThemeColor(getIndex ? 0 : 1).withOpacity(0.4),
                  onTap: () {
                    soap.setIndex(false, context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        soap.index == 0 ? 'assets/icon/exit.svg' :'assets/icon/arrow_left.svg' ,
                        width: getIndex ? 13 : 20,
                        height: 20,
                        color: theme.getThemeColor(getIndex ? 0 : 1),
                      ),
                      Padding(padding: EdgeInsets.only(left: getIndex ? 10 : 0)),
                      Visibility(
                        visible: getIndex,
                        child: Text(
                          soap.index == soapMng.MAX_INDEX ? "이전" : "나가기",
                          style: TextStyle(
                            color: theme.getThemeColor(0),
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
            visible: soap.index > 0 && soap.index < soapMng.MAX_INDEX,
            child: Expanded(
                child:Container(
                  height: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        highlightColor: theme.getThemeColor(0).withOpacity(0.4),
                        splashColor: theme.getThemeColor(0).withOpacity(0.4),
                        onTap: () {
                          soap.showSelectPop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          child: SvgPicture.asset(
                            'assets/icon/add.svg',
                            color: theme.getThemeColor(0),
                          ),
                        )
                    ),
                  ),
                ),
            ),
          ),
          Visibility(
            visible: soap.index == 3,
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
                    highlightColor: theme.getThemeColor(0).withOpacity(0.4),
                    splashColor: theme.getThemeColor(0).withOpacity(0.4),
                    onTap: () {
                      context.read<soapMng>().changeUnit();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: Icon(soap.unit_G ? Icons.change_circle : Icons.change_circle_outlined, size: 32, color: theme.getThemeColor(0),)
                    )
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: theme.getThemeColor(0),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(45)),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                  highlightColor: theme.getThemeColor(1).withOpacity(0.4),
                  splashColor: theme.getThemeColor(0).withOpacity(0.4),
                  onTap: () {
                    log("message");
                    soap.setIndex(true, context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: getIndex,
                        child: Text(
                          soap.index == soapMng.MAX_INDEX ? "    저장" : "    다음",
                          style: TextStyle(
                            color: theme.getThemeColor(1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: getIndex ? 10 : 0)),
                      SvgPicture.asset(
                        soap.index == soapMng.MAX_INDEX ? 'assets/icon/save.svg' : 'assets/icon/arrow_right.svg',
                        width: 20,
                        height: 20,
                        color: theme.getThemeColor(1),
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