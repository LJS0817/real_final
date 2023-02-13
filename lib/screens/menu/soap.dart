import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/Mng.dart';

class SoapTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: Provider.of<Mng>(context).soapSaves,
      ),
    );
  }
}