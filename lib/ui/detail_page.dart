import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/theme/app_colors.dart' as color;
import 'package:sports_app/widgets/detail/lower/lower_page.dart';
import 'package:sports_app/widgets/detail/upper/top_row.dart';
import 'package:sports_app/widgets/detail/upper/uppder_page.dart';
import 'package:sports_app/widgets/detail/lower/row_one.dart';
import 'package:video_player/video_player.dart';
import '../widgets/detail/lower/list_item.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List videoInfo = [];
  bool _playArea = false;
  late VideoPlayerController _controller;

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
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;

    if(controller != null && controller.value.isInitialized) {
      return Container(
        height: 300,
        width: 300,
        child: VideoPlayer(controller),
      );
    } else {
      return Text('Loading');
    }
  }

  _onTapVideo(int index){
    final controller = VideoPlayerController.network(videoInfo[index]['videoUrl']);
    _controller = controller;

    setState(() { });

    _controller..initialize().then((_){
      controller.play();
      setState(() { });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColors.gradientFirst.withOpacity(0.9),
                    color.AppColors.gradientSecond.withOpacity(0.9),
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(color: color.AppColors.gradientSecond),
        child: Column(
          children: [
            _playArea == false
                ? const UpperPage()
                : Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                          height: 100,
                          child: const TopRow(),
                        ),
                        _playView(context),
                      ],
                    ),
                  ),
            //LowerPage(playArea: _playArea),
            Expanded(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        itemCount: videoInfo.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () {
                              _onTapVideo(index);
                              setState(() {
                                if (!_playArea) {
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
            ),
          ],
        ),
      ),
    );
  }
}
