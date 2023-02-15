import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/data.dart';
import 'package:real_final/models/soap/soapMng.dart';

import '../../config/themeConfig.dart';

class soapContainer extends StatelessWidget {
  late Data data;

  soapContainer(Data d, {super.key}) {
    data = d;
  }

  @override
  Widget build(BuildContext context) {
    // final themeData theme = Provider.of<themeData>(context);
    return Container(
      height: 98,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: themeData.getThemeColor(0, data: data.type.index),
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
                    color: themeData.getThemeColor(1, data: data.type.index),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 4)),
                Text(
                  "2000-00-00",
                  style: TextStyle(
                    color: themeData.getThemeColor(1, data: data.type.index),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 4)),
                Text(
                  "C.P",
                  style: TextStyle(
                    color: themeData.getThemeColor(2, data: data.type.index),
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
              Provider.of<soapMng>(context).typeIcons.elementAt(data.type.index),
              fit: BoxFit.fitHeight,
              width: 120,
              height: 120,
              color: themeData.getThemeColor(2, data: data.type.index).withOpacity(0.2),
            ),
          ),
          Positioned(
            right: 4,
            bottom: 5,
            child: Text(
              "10000000g",
              style: TextStyle(
                color: themeData.getThemeColor(2, data: data.type.index),
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
