import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ScannedMobileView extends StatefulWidget {
  String vcbTechModel;
  String title;
  String description;

  ScannedMobileView(
      {super.key,
      required this.vcbTechModel,
      required this.title,
      required this.description});

  @override
  _YoutubeViewerState createState() => _YoutubeViewerState(vcbTechModel);
}

class _YoutubeViewerState extends State<ScannedMobileView> {
  late String vcbTechModel;

  _YoutubeViewerState(this.vcbTechModel);

  RxBool isChanged = false.obs;
  RxInt isPosition = 0.obs;

  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: vcbTechModel!,
      flags: const YoutubePlayerFlags(
        startAt: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onExitFullScreen: () => SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]),
        player: YoutubePlayer(
          controller: _youtubePlayerController,
          onReady: () {},
          onEnded: (metaData) {},
        ),
        builder: (context, player) {
          return InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: [
                player,
              ],
            ),
          );
        });
  }
}
