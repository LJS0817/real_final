import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/config/languageConfig.dart';
import 'package:real_final/models/soap/basic.dart';
import 'package:real_final/models/soap/footer.dart';
import 'package:real_final/models/soap/header.dart';
import 'package:real_final/models/soap/oilPopup.dart';
import 'package:real_final/models/soap/soapMng.dart';

class SoapWorkspace extends StatefulWidget {
  @override
  _SoapWorkspace createState() => _SoapWorkspace();
}


class _SoapWorkspace extends State<SoapWorkspace> {
  @override
  void initState() {
    soap.init(() { setState(() {}); });
    theme.soapDataInit();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: theme.backgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                header(),
                soap.curPage(),
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