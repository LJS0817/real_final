import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/themeConfig.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 15)),

          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "도움 및 건의",
              style: TextStyle(
                  color: theme.themeColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "이메일  :  iam0817jun@gmail.com",
              style: TextStyle(
                  color: theme.themeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          Material(
            child: InkWell(
              child: Container(
                height: 60,
                width: double.maxFinite,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: theme.themeColor,
                  borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Text(
                  "데이터 초기화",
                  style: TextStyle(
                    color: theme.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}