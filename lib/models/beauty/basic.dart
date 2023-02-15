import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/beauty/TypeButton.dart';
import 'package:real_final/models/beauty/beautyMng.dart';

class basic extends StatelessWidget {
  const basic({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 21),
        shrinkWrap: true,
        primary: false,
        children: [
          Text(
            "레시피 이름",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.getThemeColor(1),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 52,
            decoration: BoxDecoration(
              color: theme.getThemeColor(0),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: theme.getThemeColor(1),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    color: theme.getThemeColor(0).withOpacity(0.15)
                )
              ],
            ),
            child: TextField(
                cursorColor: theme.getThemeColor(1),
                controller: context.read<beautyMng>().name,
                onChanged: (String s) {
                  //context.read<beautyMng>().changeName();
                },
                autocorrect: false,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: theme.getThemeColor(1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "레시피 이름",
                  hintStyle: TextStyle(
                    color: theme.getThemeColor(1),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                )
            ),
          ),

          const Padding(padding: EdgeInsets.only(top: 38,)),
          Text(
            "비누 유형",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.getThemeColor(1),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Row(
            children: [
              typeButton(TYPE.E_SKIN),
              typeButton(TYPE.E_LOTION),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 38,)),
          Text(
            "값 입력",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.getThemeColor(0),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Container(
            alignment: Alignment.center,
            height: 60,
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(right: 5.3),
            decoration: BoxDecoration(
              color: theme.getThemeColor(0),
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.13))
              ],
            ),
            child: TextField(
              cursorColor: theme.getThemeColor(1),
              autocorrect: false,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: theme.getThemeColor(1),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                labelText: "Lye Purity",
                labelStyle: TextStyle(
                  color: theme.getThemeColor(1),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.only(right: 5.3),
                  decoration: BoxDecoration(
                    color: theme.getThemeColor(0),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.13))
                    ],
                  ),
                  child: TextField(
                    cursorColor: theme.getThemeColor(1),
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: theme.getThemeColor(1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      labelText: "Lye Purity",
                      labelStyle: TextStyle(
                        color: theme.getThemeColor(1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 2.6, vertical: 0.0),
                  height: 60,
                  decoration: BoxDecoration(
                    color: theme.getThemeColor(0),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.13))
                    ],
                  ),
                  child: TextField(
                    cursorColor: theme.getThemeColor(1),
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: theme.getThemeColor(1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      labelText: "Lye Count",
                      labelStyle: TextStyle(
                        color: theme.getThemeColor(1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 2.6, vertical: 0.0),
                  height: 60,
                  decoration: BoxDecoration(
                    color: theme.getThemeColor(0),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.13))
                    ],
                  ),
                  child: TextField(
                    cursorColor: theme.getThemeColor(1),
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: theme.getThemeColor(1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      labelText: "Lye Count",
                      labelStyle: TextStyle(
                        color: theme.getThemeColor(1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
