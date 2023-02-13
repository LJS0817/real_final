import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/Mng.dart';

class BeautyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: Provider.of<Mng>(context).beautySaves,
      ),
    );
  }
}