import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';

class oilPreview extends StatelessWidget {
  String _name = "";
  int idx = 0;

  oilPreview(String name, int i, {super.key})
  {
    _name = name;
    idx = i;
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
        border: Border.all(color: theme.getThemeColor(0), width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: theme.getThemeColor(2).withOpacity(0.7),
          highlightColor: theme.getThemeColor(2).withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            context.watch<soapMng>().removeOilContainer(idx);
          },
          child: Row (
            children: [
              const Padding(padding: EdgeInsets.only(right: 15)),
              Text(
                idx.toString() + ".  " + _name,
               style: TextStyle(color: theme.getThemeColor(0), fontWeight: FontWeight.bold, fontSize: 16),
             ),
              const Padding(padding: EdgeInsets.only(right: 20)),
              Icon(CupertinoIcons.xmark_octagon, color: theme.getThemeColor(0),),
              const Padding(padding: EdgeInsets.only(right: 8))
            ],
          ),
        ),
      )
    );
  }
}