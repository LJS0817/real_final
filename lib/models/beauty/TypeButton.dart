import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/config/languageConfig.dart';

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
              theme.changeSoapTheme(type);
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
                words.getBeautyType(type.index - 3),
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