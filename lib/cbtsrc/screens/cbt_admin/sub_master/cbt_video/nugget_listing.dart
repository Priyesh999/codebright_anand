import 'dart:async';

import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/video_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/player_type_enum.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/video_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/video_item.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NuggetsScreen extends StatefulWidget {
  int currentIndex;

  NuggetsScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _NuggetsScreenState createState() => _NuggetsScreenState();
}

class _NuggetsScreenState extends State<NuggetsScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  RxBool isRotate = false.obs;
  final FocusNode searchFocus = FocusNode();
  final TextEditingController textEditingController = TextEditingController();
  final VideoController learnDataController = Get.find<VideoController>();
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
      initialVideoId: YoutubePlayer.convertUrlToId(learnDataController
          .cbtCommonList
          .value[learnDataController.isSelectedPosition.value]!
          .image) as String,
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
    storageBox.write(
        YoutubePlayer.convertUrlToId(learnDataController.cbtCommonList
                .value[learnDataController.isSelectedPosition.value]!.image) ??
            '',
        duration);
  }

  int getDuration() {
    var duration = storageBox.read(YoutubePlayer.convertUrlToId(
            learnDataController.cbtCommonList
                .value[learnDataController.isSelectedPosition.value]!.image) ??
        '');
    return (duration != null) ? duration : 0;
  }

  void autoPlayNextVideo() {
    setState(() {
      _youtubePlayerController.load(
          YoutubePlayer.convertUrlToId(learnDataController
                  .cbtCommonList
                  .value[learnDataController.isSelectedPosition.value]!
                  .image) ??
              '',
          startAt: getDuration());
    });
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onExitFullScreen: () => SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]),
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
                      title: learnDataController
                          .cbtCommonList
                          .value[learnDataController.isSelectedPosition.value]!
                          .title,
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
                children: [
                  Text(
                    learnDataController
                        .cbtCommonList
                        .value[learnDataController.isSelectedPosition.value]!
                        .title,
                    textScaleFactor: 1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    (learnDataController
                            .cbtCommonList
                            .value[
                                learnDataController.isSelectedPosition.value]!
                            .originalModel as VideoModel)
                        .prDescription,
                    textScaleFactor: 1,
                    style: const TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: learnDataController.cbtCommonList.value.length,
            padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
            itemBuilder: (context, index) {
              if (learnDataController.cbtCommonList.value[index]!.id !=
                  learnDataController
                      .cbtCommonList
                      .value[learnDataController.isSelectedPosition.value]!
                      .id) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _youtubePlayerController.load(
                          YoutubePlayer.convertUrlToId(learnDataController
                                  .cbtCommonList.value[index]!.image) ??
                              '',
                          startAt: getDuration());
                    });
                    moveToTop();
                  },
                  child: VideoItem(
                    cbtPlayer: CbtPlayerType.CBT_VIDEO,
                    isEdit: false,
                    isTable: false,
                    isAdd: false,
                    post: learnDataController.cbtCommonList.value[index]!,
                    controller: learnDataController,
                    index: index,
                    isSelectedPosition: 9900999,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
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
