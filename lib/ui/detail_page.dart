import 'dart:convert';
import 'dart:math';
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

//    "videoUrl": "https://media.istockphoto.com/videos/three-multiethnic-people-exercising-outdoors-video-id1285367493"

class _DetailPageState extends State<DetailPage> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _isDisposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  //Only gets Called the Page it initialized.
  void _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  //initialize video before playing.
  void _initVideo(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]['videoUrl']);

    final oldController = _controller;
    _controller = controller;

    if (oldController != null) {
      oldController.removeListener(_removeControllerUpdate);
      oldController.pause();
    }

    setState(() {});

    _controller?.initialize().then((_) {
      oldController?.dispose();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }

  //Checks controller state and it updates the status of _isPlaying.
  void _onControllerUpdate() async {

    if (_isDisposed) {
      return;
    }

    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }

    _onUpdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      debugPrint("Controller is null");
      return;
    }

    if (!controller.value.isInitialized) {
      debugPrint("controller cannot be initialized");
      return;
    }

    _duration ??= _controller?.value.duration;

    var duration = _duration;
    if(duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;

    if(playing) {
      if(_isDisposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() / duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  void _removeControllerUpdate() {

  }

  String convertTwo(int value) {
    return value < 10 ? '0$value' : '$value';
  }

  //It is the area that video is playing.
  Widget _playView(BuildContext context) {
    final controller = _controller;

    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
            child: Text(
          'Preparing...',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )),
      );
    }
  }

  //Video controls such as rewind, play/pause, and forward.
  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: const RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 2),
            tickMarkShape: const RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: const TextStyle(
                color: Colors.white
            ),
          ),
          child: Slider(
            value: max(0, min(_progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split('.')[0],
            onChanged: (value) {
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value?.duration;
              if(duration != null) {
                var newValue = max(0, min(value, 99)) * 0.01;
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.only(bottom: 5),
          width: MediaQuery.of(context).size.width,
          color: color.AppColors.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                        ),
                      ],
                    ),
                    child: Icon(
                      noMute?Icons.volume_up:Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  if(noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {

                  });
                },
              ),
              FlatButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && videoInfo.isNotEmpty) {
                    _initVideo(index);
                  } else {
                    Get.snackbar(
                      'Video',
                      '',
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColors.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text(
                        'This is the first video on the list.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.fast_rewind,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  if (_isPlaying) {
                    _controller?.pause();
                  } else {
                    _controller!.play();
                  }
                  setState(() {
                    _isPlaying != _isPlaying;
                  });
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= videoInfo.length - 1) {
                    _initVideo(index);
                  } else {
                    Get.snackbar(
                      'Video',
                      '',
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColors.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text(
                        'You have finished watching all the videos. Congrats!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.fast_forward,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              Text(
                '$mins:$secs',
                style: const TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Ints video at the beginning of the page creation.
  @override
  void initState() {
    super.initState();
    _initData();
  }

  //Disposes the old video.
  @override
  void dispose() {
    _isDisposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
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
                        _controlView(context),
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
                              _initVideo(index);
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
