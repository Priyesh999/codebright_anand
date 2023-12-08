import 'dart:async';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWatchScreen extends StatefulWidget {
  String title;
  String url;

  VideoWatchScreen({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  _VideoWatchScreenState createState() => _VideoWatchScreenState();
}

class _VideoWatchScreenState extends State<VideoWatchScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  RxBool isRotate = false.obs;
  final FocusNode searchFocus = FocusNode();
  late YoutubePlayerController _youtubePlayerController;
  late Timer timer;
  final storageBox = GetStorage();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    searchFocus.addListener(() {
      setState(() {});
    });
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url) as String,
      flags: const YoutubePlayerFlags(
        startAt: 0,
      ),
    );

    //getDuration();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _youtubePlayerController.dispose();
    timer.cancel();
    super.dispose();
  }

  void listener() {
    if ((_youtubePlayerController.value.isReady) &&
        (!_youtubePlayerController.value.isPlaying)) {
      setDuration(_youtubePlayerController.value.position.inSeconds);
      // log("listener called");
      // if (_youtubePlayerController.value.isFullScreen) {
      //   isRotate.value = true;
      // }
      // if (!_youtubePlayerController.value.isFullScreen) {
      //   isRotate.value = false;
      // }
    }
  }

  void startUpdatingTime() {
    const time = Duration(seconds: 5);
    timer = Timer.periodic(time, (timer) {
      setDuration(_youtubePlayerController.value.position.inSeconds);
    });
  }

  void setDuration(int duration) {
    storageBox.write(YoutubePlayer.convertUrlToId(widget.url) ?? '', duration);
  }

  int getDuration() {
    var duration =
        storageBox.read(YoutubePlayer.convertUrlToId(widget.url) ?? '');
    return (duration != null) ? duration : 0;
  }

  void autoPlayNextVideo() {
    setState(() {
      _youtubePlayerController.load(
          YoutubePlayer.convertUrlToId(widget.url) ?? '',
          startAt: getDuration());
    });
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onExitFullScreen: () => SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]),
        player: YoutubePlayer(
          controller: _youtubePlayerController,
          onReady: () {
            _youtubePlayerController.addListener(listener);
            _youtubePlayerController.seekTo(
              Duration(seconds: getDuration()),
            );
            startUpdatingTime();
          },
          onEnded: (metaData) {},
        ),
        builder: (context, player) {
          return Obx(
            () => Scaffold(
              backgroundColor: const Color(0xfff5f5f5),
              resizeToAvoidBottomInset: false,
              appBar: isRotate.value == true
                  ? null
                  : CbtAppBar(
                      title: widget.title,
                    ),
              body: InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: RotatedBox(
                  quarterTurns: isRotate.value == true ? 5 : 0,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        player,
                        widgetNuggetTitle(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: nuggetsWidget(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;

  Widget widgetNuggetTitle() {
    return Container(
      color: const Color(0xffe8e8e8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
            // Row(
            //   children: [
            //     ...LearnCommonWidget().widgetLikeShare(
            //       isLiked: false,
            //       likeColor: CommonColor().black,
            //       shareColor: CommonColor().greyShade1,
            //       callBack: () {
            //         CommonMethod().shareUniv(
            //           '${CommonString().deepLinkingSchemeAndHost}type=learn&sub=nugget&nuggetId=${learnDataController.nuggets[currentNuggetIndex].id}',
            //           generateDynamicLinkAndShare: true,
            //           contentPresent: true,
            //           content:
            //               'I just learnt some stuff about finance and I\'m feeling pretty smart! Give it a try?',
            //         );
            //       },
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget nuggetsWidget() {
    return Container(
      color: const Color(0xfff5f5f5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Divider(
              thickness: 0.5,
              endIndent: 16,
              indent: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void moveToTop() {
    Future.delayed(const Duration(milliseconds: 300));
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn);
    });
  }
}
