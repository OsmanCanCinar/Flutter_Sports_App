import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sports_app/widgets/detail/lower/row_one.dart';
import 'list_item.dart';

class LowerPage extends StatefulWidget {
  LowerPage({
    required this.playArea,
    Key? key,
  }) : super(key: key);

  bool playArea;

  @override
  State<LowerPage> createState() => _LowerPageState();
}

class _LowerPageState extends State<LowerPage> {
  List videoInfo = [];
  late bool _playArea;

  initBool() {
    _playArea =  widget.playArea;
  }

  void _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
    initBool();
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
            const SizedBox(height: 30),
            const RowOne(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                itemCount: videoInfo.length,
                itemBuilder: (_, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if(!_playArea) {
                          _playArea = true;
                        }
                      });
                    },
                    child: ListItem(videoInfo: videoInfo, index: index),
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
