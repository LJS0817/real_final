import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/models/soap/basic.dart';
import 'package:real_final/models/soap/footer.dart';
import 'package:real_final/models/soap/header.dart';
import 'package:real_final/models/soap/oilPopup.dart';
import 'package:real_final/models/soap/soapMng.dart';

class SoapWorkspace extends StatelessWidget {
  const SoapWorkspace({super.key});

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
                context.watch<soapMng>().curPage,
                footer(),
              ],
            ),
            oilPopup(),
          ],
        ),
      ),
    );
  }
}