import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';

class addMemo extends StatelessWidget {
  const addMemo({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData theme = Provider.of<themeData>(context);
    final soapMng soap = Provider.of<soapMng>(context);
    return Expanded(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          Text("메모", style: TextStyle(color: theme.getTypeColor(0), fontWeight: FontWeight.bold, fontSize: 16 ),),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: theme.getTypeColor(1),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: theme.getTypeColor(0),
                  width: 5,
                  strokeAlign: StrokeAlign.inside,
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.13)
                  )
                ],
              ),
              child: TextField(
                cursorColor: theme.getTypeColor(0),
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                autocorrect: false,
                controller: soap.memo,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                style: TextStyle(
                  color: theme.getTypeColor(0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Here",
                  hintStyle: TextStyle(color: theme.getTypeColor(0).withOpacity(0.3)),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
