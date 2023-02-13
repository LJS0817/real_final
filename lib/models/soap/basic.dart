import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';

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
              color: theme.soapThemeColor[0],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 52,
            decoration: BoxDecoration(
              color: theme.soapThemeColor[1],
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    color: theme.soapThemeColor[0].withOpacity(0.15)
                )
              ],
            ),
            child: TextField(
                cursorColor: theme.soapThemeColor[0],
                controller: context.read<soapMng>().name,
                onChanged: (String s) {
                  context.read<soapMng>().changeName();
                },
                autocorrect: false,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: theme.soapThemeColor[0],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "레시피 이름",
                  hintStyle: TextStyle(
                    color: theme.soapThemeColor[0],
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
              color: theme.soapThemeColor[0],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: theme.getSoapType(TYPE.E_COLD, 0, 3),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    highlightColor: theme.soapThemeColor[2].withOpacity(0.4),
                    splashColor: theme.getSoapType(TYPE.E_COLD, 1, 0).withOpacity(0.6),
                    onTap: () {
                      theme.changeSoapTheme(TYPE.E_COLD);

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 84,
                      width: 84,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 20,
                              color: theme.soapThemeColor[0].withOpacity(0.15)
                          )
                        ],
                      ),
                      child: Text(
                        "C.P",
                        style: TextStyle (
                          color: theme.getSoapType(TYPE.E_COLD, 1, 0),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: theme.getSoapType(TYPE.E_HOT, 0, 3),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    highlightColor: theme.soapThemeColor[2].withOpacity(0.4),
                    splashColor: theme.getSoapType(TYPE.E_HOT, 1, 0).withOpacity(0.6),
                    onTap: () {
                      theme.changeSoapTheme(TYPE.E_HOT);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 84,
                      width: 84,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 20,
                              color: theme.soapThemeColor[0].withOpacity(0.15)
                          )
                        ],
                      ),
                      child: Text(
                        "H.P",
                        style: TextStyle (
                          color: theme.getSoapType(TYPE.E_HOT, 1, 0),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: theme.getSoapType(TYPE.E_PASTE, 0, 3),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    highlightColor: theme.soapThemeColor[2].withOpacity(0.4),
                    splashColor: theme.getSoapType(TYPE.E_PASTE, 1, 0).withOpacity(0.6),
                    onTap: () {
                      theme.changeSoapTheme(TYPE.E_PASTE);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 84,
                      width: 84,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 20,
                              color: theme.soapThemeColor[0].withOpacity(0.15)
                          )
                        ],
                      ),
                      child: Text(
                        "연비누",
                        style: TextStyle (
                          color: theme.getSoapType(TYPE.E_PASTE, 1, 0),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Padding(
              padding: EdgeInsets.only(
                top: 38,
              )),
          Text(
            "값 입력",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.soapThemeColor[0],
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
                    color: theme.soapThemeColor[0],
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.13))
                    ],
                  ),
                  child: TextField(
                    cursorColor: theme.soapThemeColor[1],
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: theme.soapThemeColor[1],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      labelText: "Lye Purity",
                      labelStyle: TextStyle(
                        color: theme.soapThemeColor[1],
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
                    color: theme.soapThemeColor[0],
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.13))
                    ],
                  ),
                  child: TextField(
                    cursorColor: theme.soapThemeColor[1],
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: theme.soapThemeColor[1],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      labelText: "Lye Count",
                      labelStyle: TextStyle(
                        color: theme.soapThemeColor[1],
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: theme.type == TYPE.E_COLD,
                child: Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    margin: const EdgeInsets.only(left: 5.3),
                    height: 60,
                    decoration: BoxDecoration(
                      color: theme.soapThemeColor[0],
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.13))
                      ],
                    ),
                    child: TextField(
                      cursorColor: theme.soapThemeColor[1],
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: theme.soapThemeColor[1],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: "Water",
                        labelStyle: TextStyle(
                          color: theme.soapThemeColor[1],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Visibility(
            visible: theme.type == TYPE.E_HOT,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    margin: const EdgeInsets.only(right: 5.3),
                    decoration: BoxDecoration(
                      color: theme.soapThemeColor[0],
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.13))
                      ],
                    ),
                    child: TextField(
                      cursorColor: theme.soapThemeColor[1],
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: theme.soapThemeColor[1],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: "Pure soap",
                        labelStyle: TextStyle(
                          color: theme.soapThemeColor[1],
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
                      color: theme.soapThemeColor[0],
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.13))
                      ],
                    ),
                    child: TextField(
                      cursorColor: theme.soapThemeColor[1],
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: theme.soapThemeColor[1],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: "Glycerine",
                        labelStyle: TextStyle(
                          color: theme.soapThemeColor[1],
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
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Visibility(
            visible: theme.type == TYPE.E_HOT,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    margin: const EdgeInsets.only(right: 5.3),
                    decoration: BoxDecoration(
                      color: theme.soapThemeColor[0],
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.13))
                      ],
                    ),
                    child: TextField(
                      cursorColor: theme.soapThemeColor[1],
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: theme.soapThemeColor[1],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: "Solvent",
                        labelStyle: TextStyle(
                          color: theme.soapThemeColor[1],
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
                      color: theme.soapThemeColor[0],
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.13))
                      ],
                    ),
                    child: TextField(
                      cursorColor: theme.soapThemeColor[1],
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: theme.soapThemeColor[1],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: "Ethanol",
                        labelStyle: TextStyle(
                          color: theme.soapThemeColor[1],
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
                    margin: const EdgeInsets.only(left: 5.3),
                    height: 60,
                    decoration: BoxDecoration(
                      color: theme.soapThemeColor[0],
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.13))
                      ],
                    ),
                    child: TextField(
                      cursorColor: theme.soapThemeColor[1],
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: theme.soapThemeColor[1],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: "Sugar",
                        labelStyle: TextStyle(
                          color: theme.soapThemeColor[1],
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
          ),

        ],
      ),
    );
  }
}
