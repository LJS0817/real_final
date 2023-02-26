import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/beauty/TypeButton.dart';
import 'package:real_final/models/beauty/beautyMng.dart';

class selectType extends StatelessWidget {
  final double boxSize = 140;
  static const double padding = 20;

  const selectType({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    return Expanded(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 16,)),
          Text(
            words.getBeautyText(12),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.getThemeColor(1),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: padding,)),
              skinTypeButton(SKIN_TYPE.E_SENSITIVE),
              const Padding(padding: EdgeInsets.only(left: 8,)),
              skinTypeButton(SKIN_TYPE.E_DRY),
              const Padding(padding: EdgeInsets.only(left: padding,)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: padding,)),
              skinTypeButton(SKIN_TYPE.E_ILL),
              const Padding(padding: EdgeInsets.only(left: 8,)),
              skinTypeButton(SKIN_TYPE.E_MIXED),
              const Padding(padding: EdgeInsets.only(left: padding,)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 13,)),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: padding,)),
              skinTypeButton(SKIN_TYPE.E_OILY),
              const Padding(padding: EdgeInsets.only(left: 8,)),
              skinTypeButton(SKIN_TYPE.E_ACNE),
              const Padding(padding: EdgeInsets.only(left: padding,)),
            ],
          ),
        ],
      ),
    );
  }
}
