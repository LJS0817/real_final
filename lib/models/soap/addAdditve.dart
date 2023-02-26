import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';

class addAdd extends StatelessWidget {
  const addAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    final soapMng soap = Provider.of<soapMng>(context);
    return Expanded(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          Text(words.getSoapText(18), style: TextStyle(color: theme.getThemeColor(0), fontWeight: FontWeight.bold, fontSize: 16 ),),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: context.watch<soapMng>().oil_selected.values.toList(),
            ),
          ),
          Visibility(
            visible: soap.oil_selected.length == 0,
            child: Column(
                children: [
                  Text(
                    words.getSoapText(20),
                    style: TextStyle(
                      color: theme.getThemeColor(0).withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 25,
                    color: theme.getThemeColor(0).withOpacity(0.7),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
