import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: theme.soapThemeColor[0],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: theme.soapThemeColor[2].withOpacity(0.7),
          highlightColor: theme.soapThemeColor[2].withOpacity(0.7),
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            soap.oil_selected.remove(idx);
            soap.Update();
          },
          child: Row (
            children: [
              const Padding(padding: EdgeInsets.only(right: 15)),
              Text(
                idx.toString() + ".  " + _name,
                style: TextStyle(color: theme.soapThemeColor[1], fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Padding(padding: EdgeInsets.only(right: 10)),
              Icon(CupertinoIcons.xmark_octagon, color: theme.soapThemeColor[1],),
              const Padding(padding: EdgeInsets.only(right: 15))
            ],
          ),
        ),
      )
    );
  }
}