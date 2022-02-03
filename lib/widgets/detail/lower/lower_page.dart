import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sports_app/theme/app_colors.dart' as color;
import 'package:sports_app/widgets/detail/lower/row_one.dart';

class LowerPage extends StatefulWidget {
  const LowerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LowerPage> createState() => _LowerPageState();
}

class _LowerPageState extends State<LowerPage> {
  List videoInfo = [];

  void _initData() {
    DefaultAssetBundle.of(context)
        .loadString('assets/json/videoinfo.json')
        .then((value) {
      videoInfo = json.decode(value);
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
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            RowOne(),
            Expanded(
                child: ListView.builder(
                  itemCount: videoInfo.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        height: 135,
                          child: Column(
                            children: [

                            ],
                          ),
                      ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
