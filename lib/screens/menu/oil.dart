import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/Mng.dart';

import '../../config/themeConfig.dart';

class OilTab extends StatelessWidget {
  const OilTab({super.key});

  @override
  Widget build(BuildContext context) {
    final Mng mng = Provider.of<Mng>(context);
    final themeData theme = Provider.of<themeData>(context);
    if(mng.isWorkspace) mng.isWorkspace = false;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListView(
        primary: false,
        children: [
          Visibility(
            visible: mng.user_oils.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text("사용자 오일", style: TextStyle(color: theme.themeColor, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
                Column(
                    children: mng.user_oils.values.toList()
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                Container(
                  height: 6,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: theme.themeColor,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
              ],
            ),
          ),
          Visibility(
            visible: mng.marked_oils.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text("즐겨찾기", style: TextStyle(color: theme.themeColor, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
                Column(
                    children: mng.marked_oils.values.toList()
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                Container(
                  height: 6,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: theme.themeColor,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
              ],
            ),
          ),
          Column(
              children: mng.Oils.values.toList(),
          ),
        ],
      ),
    );
  }
}