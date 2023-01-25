import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:real_final/models/index/oilContainer.dart';
import 'package:real_final/config/Mng.dart';

class OilTab extends StatelessWidget {
  const OilTab({super.key});

  @override
  Widget build(BuildContext context) {
    if(mng.isWorkspace) mng.isWorkspace = false;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: mng.oils.values.toList(),
      ),
    );
  }
}