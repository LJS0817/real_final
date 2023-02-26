import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';

import '../../config/languageConfig.dart';

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
            words.getText(0),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.getThemeColor(0),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 52,
            decoration: BoxDecoration(
              color: theme.getThemeColor(1),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: theme.getThemeColor(0),
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
                cursorColor: theme.getThemeColor(0),
                controller: context.read<soapMng>().name,
                onChanged: (String s) {
                  context.read<soapMng>().changeName();
                },
                autocorrect: false,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: theme.getThemeColor(0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: words.getText(0),
                  hintStyle: TextStyle(
                    color: theme.getThemeColor(0),
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
            words.getSoapText(7),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.getThemeColor(0),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: theme.getTypeColor(TYPE.E_COLD, 0, 3),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    highlightColor: theme.getThemeColor(2).withOpacity(0.4),
                    splashColor: theme.getTypeColor(TYPE.E_COLD, 1, 0).withOpacity(0.6),
                    onTap: () {
                      theme.changeWorkspaceTheme(TYPE.E_COLD);

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
                              color: theme.getThemeColor(0).withOpacity(0.15)
                          )
                        ],
                      ),
                      child: Text(
                        words.getSoapText(4),
                        style: TextStyle (
                          color: theme.getTypeColor(TYPE.E_COLD, 1, 0),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: theme.getTypeColor(TYPE.E_HOT, 0, 3),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    highlightColor: theme.getThemeColor(2).withOpacity(0.4),
                    splashColor: theme.getTypeColor(TYPE.E_HOT, 1, 0).withOpacity(0.6),
                    onTap: () {
                      theme.changeWorkspaceTheme(TYPE.E_HOT);
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
                              color: theme.getThemeColor(0).withOpacity(0.15)
                          )
                        ],
                      ),
                      child: Text(
                        words.getSoapText(5),
                        style: TextStyle (
                          color: theme.getTypeColor(TYPE.E_HOT, 1, 0),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: theme.getTypeColor(TYPE.E_PASTE, 0, 3),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    highlightColor: theme.getThemeColor(2).withOpacity(0.4),
                    splashColor: theme.getTypeColor(TYPE.E_PASTE, 1, 0).withOpacity(0.6),
                    onTap: () {
                      theme.changeWorkspaceTheme(TYPE.E_PASTE);
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
                              color: theme.getThemeColor(0).withOpacity(0.15)
                          )
                        ],
                      ),
                      child: Text(
                        words.getSoapText(6),
                        style: TextStyle (
                          color: theme.getTypeColor(TYPE.E_PASTE, 1, 0),
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
            words.getText(1),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.getThemeColor(0),
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
                      labelText: words.getSoapText(8),
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
                      labelText: words.getSoapText(9),
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
              Visibility(
                visible: theme.type == TYPE.E_COLD,
                child: Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    margin: const EdgeInsets.only(left: 5.3),
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
                        labelText: words.getSoapText(10),
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
                        labelText: words.getSoapText(11),
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
                        labelText: words.getSoapText(14),
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
                        labelText: words.getSoapText(12),
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
                        labelText: words.getSoapText(13),
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
                    margin: const EdgeInsets.only(left: 5.3),
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
                        labelText: words.getSoapText(15),
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
          ),

        ],
      ),
    );
  }
}
