import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;

import 'list_item.dart';

class BodyParts extends StatefulWidget {
  const BodyParts({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyParts> createState() => _BodyPartsState();
}

class _BodyPartsState extends State<BodyParts> {

  List info = [];

  void _initData() {
    DefaultAssetBundle.of(context)
        .loadString('assets/json/info.json')
        .then((value) {
      info = json.decode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: (info.length.toDouble() / 2).toInt(),
        itemBuilder: (_, index) {

          int a = 2 * index;
          int b = a + 1;

          return Row(
            children: [
              ListItem(info: info, index: a),
              ListItem(info: info, index: b),
            ],
          );
        },
      ),
    );
  }
}