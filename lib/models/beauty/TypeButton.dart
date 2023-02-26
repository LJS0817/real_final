import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/models/beauty/beautyMng.dart';

class typeButton extends StatelessWidget {
  late TYPE type;

  typeButton(TYPE t, {super.key}) {
    type = t;
  }

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    return Expanded(
      child: Container(
        height: 80,
        child: Material(
          color: theme.getTypeColor(type, 1, 0),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: theme.getThemeColor(2).withOpacity(0.4),
            splashColor: theme.getTypeColor(type, 1, 0).withOpacity(0.6),
            onTap: () {
              theme.changeWorkspaceTheme(type);
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
                words.getBeautyText(type.index - 3),
                style: TextStyle (
                  color: theme.getTypeColor(type, 3, 1),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}


class skinTypeButton extends StatelessWidget {
  late SKIN_TYPE type;

  skinTypeButton(SKIN_TYPE t, {super.key}) {
    type = t;
  }

  TYPE getType(BuildContext context) {
    return Provider.of<beautyMng>(context).type == type ? Provider.of<themeData>(context).type : TYPE.E_ETC;
  }

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    final beautyMng beauty = Provider.of<beautyMng>(context);
    return Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.173,
          child: Material(
            color: theme.getTypeColor(getType(context), 1, 0),
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              highlightColor: theme.getThemeColor(2).withOpacity(0.4),
              splashColor: theme.getTypeColor(theme.type, 1, 0).withOpacity(0.6),
              onTap: () {
                beauty.setSkinType(type);
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
                  words.getBeautyText(type.index + 6),
                  style: TextStyle (
                    color: theme.getTypeColor(getType(context), 3, 1),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}