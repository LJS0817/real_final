import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/data.dart';
import 'package:real_final/models/beauty/beautyMng.dart';

import '../../config/themeConfig.dart';

class beautyContainer extends StatelessWidget {
  late Data data;

  beautyContainer(Data d, {super.key}) {
    data = d;
  }

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    return Container(
      height: 98,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.getThemeColor(0),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "레시피테스트이름",
                  style: TextStyle(
                    color: theme.getThemeColor(1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 4)),
                Text(
                  "2000-00-00",
                  style: TextStyle(
                    color: theme.getThemeColor(1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 4)),
                Text(
                  "C.P",
                  style: TextStyle(
                    color: theme.getThemeColor(1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            top: 5,
            bottom: 5,
            child: SvgPicture.asset(
              Provider.of<beautyMng>(context).typeIcons.elementAt(data.type.index - 3),
              fit: BoxFit.fitHeight,
              width: 120,
              height: 120,
              color: theme.getThemeColor(2).withOpacity(0.2),
            ),
          ),
          Positioned(
            right: 4,
            bottom: 5,
            child: Text(
              "10000000g",
              style: TextStyle(
                color: theme.getThemeColor(2),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}