import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/models/beauty/beautyMng.dart';
import 'package:real_final/models/beauty//basic.dart';
import 'package:real_final/models/beauty/footer.dart';
import 'package:real_final/models/beauty/header.dart';
import 'package:real_final/models/soap/soapMng.dart';

class BeautyWorkspace extends StatelessWidget {
  const BeautyWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.read<themeData>().backgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                header(),
                context.watch<beautyMng>().curPage,
                footer(),
              ],
            ),
            //oilPopup(),
          ],
        ),
      ),
    );
  }
}