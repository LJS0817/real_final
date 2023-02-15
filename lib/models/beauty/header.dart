import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/models/beauty/beautyMng.dart';
import 'package:real_final/models/soap/soapMng.dart';

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    final beautyMng beauty = Provider.of<beautyMng>(context);
    return Container(
      height: 205,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: theme.getThemeColor(0),
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(45), bottomLeft: Radius.circular(45)),
      ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: SvgPicture.asset(
                beauty.typeIcons.elementAt(theme.type.index),
                width: 120,
                height: 120,
                color: theme.getThemeColor(2).withOpacity(0.1),
              ),
            ),
            Positioned(
                left: 20,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(beauty.name.value.text, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.getThemeColor(1),),),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text("2000-00-00", style: TextStyle(color: theme.getThemeColor(1),fontWeight: FontWeight.bold,),),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text(words.getSoapText(1 + theme.type.index), style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: theme.getThemeColor(2),),),
                  ],
                )
            ),
            Positioned(
              right: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                "${words.getSoapText(0)}\n${words.getSoapText(1)}\n${words.getSoapText(2)}\n${words.getSoapText(3)}",
                style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: theme.getThemeColor(1),
                ),
              ),
            ),
            Positioned(
              right: 20,
              child: Text(
                "0\n0\n12\n0",
                textAlign: TextAlign.right,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: theme.getThemeColor(1),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}