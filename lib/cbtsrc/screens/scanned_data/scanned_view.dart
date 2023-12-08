import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/screens/scanned_data/scanned_controller.dart';
import 'package:digigyan/cbtsrc/screens/scanned_data/scanned_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../cbt_helpers/cbt_loader.dart';
import '../../cbt_helpers/dxwidget/codebright_text.dart';
import '../my_watch_list/watch_list_video.dart';
import '../online_learn/pg_online_learn.dart';
import '../widgets/emoticons.dart';
import '../widgets/styles/app_color.dart';
import '../widgets/styles/fonts.dart';
import '../widgets/styles/text_style.dart';

class ScannedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ScannedController());
    return ScannedPageState();
  }
}

class ScannedPageState extends GetView<ScannedController> {
  String title;

  ScannedPageState({this.title = "Scanned Data"});

  @override
  Widget build(BuildContext context) {
    // controller.setUserDetails();
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Visibility(
                visible: !controller.isLoading.value,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // TextButton(
                    //     child: Card(
                    //       color: CodebrightColor.cbtPrimarColor,
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: CBTTextNew(
                    //           title,
                    //           style:
                    //               TStyle.f10_B.styleWith(color: Colors.white),
                    //         ),
                    //       ),
                    //     ),
                    //     onPressed: () => {controller.loadSubject()}),
                  ],
                ),
              ),
              Expanded(
                child: homeBody(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeBody(BuildContext context) {
    return Container(
      child: GetPlatform.isWeb ? _web(context) : _mobile(context),
    );
  }

  Widget _web(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              child: Row(
            children: [
              Expanded(
                flex: 1,
                child: controller.watchListCopy.isEmpty
                    ? Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CBTLoaderProgress(
                              isImage: false,
                              isGif: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: EmoticonsView(
                              text: "Please add to item for Scanned",
                              button: TextButton(
                                  child: Card(
                                    color: CodebrightColor.cbtPrimarColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CBTTextNew(
                                        "Go",
                                        style: TStyle.f10_B
                                            .styleWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => {Get.to(LearnPage())}),
                            ),
                          ),
                        ],
                      )
                    // : Expanded(
                    //     child: GridView.builder(
                    //       gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //               crossAxisCount: 2),
                    //       itemCount: controller.watchList.value.length,
                    //       itemBuilder: (context, index) => GestureDetector(
                    //         onTap: () => {
                    //           // controller.onUpdateListClick(index,
                    //           //     isView: controller.isView.value,
                    //           //     isDelete: controller.isDelete.value),
                    //
                    //           // controller.onReady()
                    //         },
                    //         child: WatchListItem(
                    //           post: controller.watchList.value[index]!,
                    //           controller: controller,
                    //           index: index,
                    //           isSelectedPosition:
                    //               controller.isSelectedPosition.value,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Visibility(
                              visible:
                                  controller.watchListCopy.value.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: recentVideo(
                                    controller.watchListCopy.value,
                                    context,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              child: Column(
            children: [
              Expanded(
                flex: 1,
                child: controller.watchList.isEmpty
                    ? Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CBTLoaderProgress(
                              isImage: false,
                              isGif: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: EmoticonsView(
                              text: "",
                              button: TextButton(
                                  child: Card(
                                    color: CodebrightColor.cbtPrimarColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CBTTextNew(
                                        "Refresh",
                                        style: TStyle.f10_B
                                            .styleWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => {controller.loadSubject()}),
                            ),
                          ),
                        ],
                      )
                    // : Expanded(
                    //     child: ListView.builder(
                    //     itemCount: controller.watchList.length,
                    //     itemBuilder: (context, index) => GestureDetector(
                    //       onTap: () => {},
                    //       child: WatchListItem(
                    //         post: controller.watchList.value[index]!,
                    //         controller: controller,
                    //         index: index,
                    //         isSelectedPosition:
                    //             controller.isSelectedPosition.value,
                    //       ),
                    //     ),
                    //   )),
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Visibility(
                              visible:
                                  controller.watchListCopy.value.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: recentVideo(
                                    controller.watchListCopy.value,
                                    context,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  recentVideo(List<ScannedModel> value, BuildContext context) {
    List<Widget> videoWidget = List.empty(growable: true);
    value.forEach((element) {
      videoWidget.add(InkWell(
        onTap: () {
          Get.to(VideoWatchScreen(
            title: element.prVideo!.prBook!.prName!,
            url: element.prVideo!.prVideoUrl!,
          ));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            //DecorationImage
            // border: Border.all(
            //   color: Colors.red.shade100,
            //   width: 1,
            // ), //Border.all
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.red.shade50,
                offset: const Offset(
                  0.5,
                  0.5,
                ), //Offset
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Row(
            children: [
              Container(
                  height: 150,
                  width: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                          child: Container(
                        width: 150,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                YoutubePlayer.getThumbnail(
                                    videoId: YoutubePlayer.convertUrlToId(
                                            element.prVideo!.prVideoUrl!) ??
                                        '')),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                      Visibility(
                        visible: true,
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  )),
              SizedBox(width: 5),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    right: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CBTTextNew(
                      //   element.prVideo!.prTopic!.prName!,
                      //   style: TStyle.f10_B
                      //       .styleWith(fontFamily: AppFontsNeo.leagueBold),
                      // ),
                      SizedBox(height: 8),
                      CBTTextNew(
                        element.prVideo!.prBook!.prName!,
                        style: TStyle.f10_S.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                        maxLine: 5,
                      ),
                      SizedBox(height: 8),
                      CBTTextNew(
                        element.prVideo!.prCategory!.prName!,
                        style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                        maxLine: 5,
                      ),
                      SizedBox(height: 8),
                      // CBTTextNew(
                      //   element.prVideo!.prName! ?? "",
                      //   style: TStyle.f10_S.styleWith(
                      //     fontFamily: AppFontsNeo.leagueBold,
                      //   ),
                      //   maxLine: 5,
                      // ),
                      // SizedBox(height: 8),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    });

    return videoWidget;
  }
}
