import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';
import 'package:real_final/config/Oil.dart';

class oilView extends StatelessWidget {
  late Oil data;

  double prevWeight = 0;

  TextEditingController g = TextEditingController();
  TextEditingController per = TextEditingController();

  oilView(Oil d, {super.key})
  {
    data = d;
    prevWeight = 0;
  }

  double getWeight() {
    try{
      double d = double.parse(g.value.text);
      return d;
    } on FormatException catch (_, e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    final soapMng soap = Provider.of<soapMng>(context);
    return Container(
        height: 75,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          color: theme.getThemeColor(1),
          border: Border.all(color: theme.getThemeColor(0), width: 4),
          borderRadius: BorderRadius.circular(21),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: theme.getThemeColor(2).withOpacity(0.7),
            highlightColor: theme.getThemeColor(2).withOpacity(0.7),
            focusColor: Colors.transparent,
            borderRadius: BorderRadius.circular(21),
            onTap: () {
              prevWeight = -prevWeight;
              soap.removeOilContainer(data.index);
            },
            child: Stack (
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 15,
                  top: 12,
                  child: Text(
                    data.index.toString() + ".  " + data.korean,
                    style: TextStyle(color: theme.getThemeColor(0), fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 38,
                  child: Text(
                    data.english,
                    style: TextStyle(color: theme.getThemeColor(0).withOpacity(0.5), fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 8,
                  left: MediaQuery.of(context).size.width * 0.56,
                  child: Container(
                    width: 200,
                    child: TextField(
                        controller: soap.unit_G ? g : per,
                        cursorColor: theme.getThemeColor(0),
                        autocorrect: false,
                        textDirection: TextDirection.rtl,
                        keyboardType: TextInputType.number,
                        onEditingComplete: () {
                          soap.addWeight(data.index, false);
                        },
                        style: TextStyle(
                          color: theme.getThemeColor(0),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          hintText: soap.unit_G ? "G" : "%",
                          hintStyle: TextStyle(
                            color: theme.getThemeColor(0),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          fillColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          filled: false,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        )
                    ),
                  )
                ),
                // Icon(CupertinoIcons.xmark_octagon, color: theme.getThemeColor(1],),
                // const Padding(padding: EdgeInsets.only(right: 15))
              ],
            ),
          ),
        )
    );
  }
}