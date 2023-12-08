import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

import '../../../online_learn/vcb_model.dart';

class YoutubeViewer extends StatefulWidget {
  VcbTechModel vcbTechModel;
  YoutubeViewer({super.key, required this.vcbTechModel});

  @override
  _YoutubeViewerState createState() => _YoutubeViewerState(vcbTechModel);
}

class _YoutubeViewerState extends State<YoutubeViewer> {
  late YoutubePlayerController _controller;
  late VcbTechModel vcbTechModel;
  _YoutubeViewerState(this.vcbTechModel);

  RxBool isChanged = false.obs;
  RxInt isPosition = 0.obs;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: vcbTechModel.data!
          .prVideoData![isPosition.value].prVideo!.prVideoUrl!
          .split("/")
          .last,
      params: const YoutubePlayerParams(
        //startAt: Duration(minutes: 1, seconds: 5),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: true,
        autoPlay: true,
        enableCaption: true,
        showVideoAnnotations: false,
        enableJavaScript: true,
        privacyEnhanced: true,
        useHybridComposition: true,
        playsInline: true,
      ),
    )..listen((value) {
        if (value.isReady && !value.hasPlayed) {
          _controller
            ..hidePauseOverlay()
            ..play()
            ..hideTopMenu();
        }
        if (value.hasPlayed) {
          _controller..hideEndScreen();
        }
      });

    _controller.onExitFullscreen = () {
      // Navigator.of(context).pop();
    };
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayerIFrame();
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10),
                YoutubePlayerControllerProvider(
                  key: UniqueKey(),
                  controller: _controller,
                  child: player,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CBTTextNew(
                    vcbTechModel.data!
                        .prVideoData![isPosition.value].prName!,
                    style: TStyle.f20_B.styleWith(
                      color: Colors.teal,
                      fontFamily: AppFontsNeo.leagueBold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CBTTextNew(
                    vcbTechModel.data!
                        .prVideoData![isPosition.value].prDescription!,
                    style: TStyle.f20_B.styleWith(
                      color: Colors.teal,
                      fontFamily: AppFontsNeo.leagueBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: nuggetsWidget(),
              ))
        ],
      ),
    );
  }

  Widget nuggetsWidget() {
    return Obx(() => isChanged.value
        ? SingleChildScrollView(
            child: Container(
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
                    itemCount:
                        vcbTechModel.data!.prVideoData!.length,
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                    itemBuilder: (context, index) {
                      if (vcbTechModel.data!
                              .prVideoData![index]!.prChapterId !=
                          vcbTechModel.data!
                              .prVideoData![isPosition.value]!.prChapterId) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isPosition.value = index;
                              isChanged.value = true;
                              _controller = YoutubePlayerController(
                                initialVideoId:
                                    vcbTechModel
                                    .data!
                                    .prVideoData![index]
                                    .prVideo!
                                    .prVideoUrl!
                                    .split("/")
                                    .last, // livestream cbtpri
                                params: const YoutubePlayerParams(
                                  //startAt: Duration(minutes: 1, seconds: 5),
                                  showControls: true,
                                  showFullscreenButton: true,
                                  desktopMode: true,
                                  autoPlay: true,
                                  enableCaption: true,
                                  showVideoAnnotations: false,
                                  enableJavaScript: true,
                                  privacyEnhanced: true,
                                  useHybridComposition: true,
                                  playsInline: true,
                                ),
                              )..listen((value) {
                                  if (value.isReady && !value.hasPlayed) {
                                    _controller
                                      ..hidePauseOverlay()
                                      ..play()
                                      ..hideTopMenu();
                                  }
                                  if (value.hasPlayed) {
                                    _controller..hideEndScreen();
                                  }
                                });

                              _controller.onExitFullscreen = () {
                                // Navigator.of(context).pop();
                              };
                              isChanged.value = false;
                            });

                            setState(() {});
                          },
                          child: ListTile(
                            title:
                                        vcbTechModel
                                        .data!
                                        .prVideoData![isPosition.value]
                                        .prChapterId ==
                                    vcbTechModel
                                        .data!.prVideoData![index].prChapterId!
                                ? ShakeWidget(
                                    child: Card(
                                      color: Colors.teal,
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: CBTTextNew(

                                              vcbTechModel
                                                  .data!
                                              .prVideoData![index]
                                              .prName!,
                                          style: TStyle.f16_B
                                              .styleWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CBTTextNew(
                                          vcbTechModel
                                          .data!
                                          .prVideoData![index]
                                          .prName!),
                                    ),
                                  ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            child: Container(
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
                    itemCount:
                        vcbTechModel.data!.prVideoData!.length,
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                    itemBuilder: (context, index) {
                      if (vcbTechModel.data!
                              .prVideoData![index].prChapterId !=
                          vcbTechModel.data!
                              .prVideoData![isPosition.value].prChapterId) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isPosition.value = index;
                              isChanged.value = true;
                              _controller = YoutubePlayerController(
                                initialVideoId:
                                    vcbTechModel
                                    .data!
                                    .prVideoData![index]!
                                    .prVideo!
                                    .prVideoUrl!
                                    .split("/")
                                    .last, // livestream cbtpri
                                params: const YoutubePlayerParams(
                                  //startAt: Duration(minutes: 1, seconds: 5),
                                  showControls: true,
                                  showFullscreenButton: true,
                                  desktopMode: true,
                                  autoPlay: true,
                                  enableCaption: true,
                                  showVideoAnnotations: false,
                                  enableJavaScript: true,
                                  privacyEnhanced: true,
                                  useHybridComposition: true,
                                  playsInline: true,
                                ),
                              )..listen((value) {
                                  if (value.isReady && !value.hasPlayed) {
                                    _controller
                                      ..hidePauseOverlay()
                                      ..play()
                                      ..hideTopMenu();
                                  }
                                  if (value.hasPlayed) {
                                    _controller..hideEndScreen();
                                  }
                                });

                              _controller.onExitFullscreen = () {
                                // Navigator.of(context).pop();
                              };
                              isChanged.value = false;
                            });

                            setState(() {});
                          },
                          child: ListTile(
                            title:
                                        vcbTechModel
                                        .data!
                                        .prVideoData![isPosition.value]
                                        .prChapterId ==
                                    vcbTechModel
                                        .data!.prVideoData![index].prChapterId!
                                ? ShakeWidget(
                                    child: Card(
                                      color: Colors.teal,
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: CBTTextNew(
                                              vcbTechModel
                                              .data!
                                              .prVideoData![index]
                                              .prName!,
                                          style: TStyle.f16_B
                                              .styleWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CBTTextNew(vcbTechModel
                                          .data!
                                          .prVideoData![index]
                                          .prName!),
                                    ),
                                  ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ));
  }
}
