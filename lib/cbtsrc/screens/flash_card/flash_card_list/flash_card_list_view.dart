import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbt_loader.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/flash_card_list/flash_card_list_controller.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/flash_card_list/flash_card_list_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlashCardGrid extends GetView<FlashCardGridController> {
  String title;

  FlashCardGrid({this.title = "Flash Card"});

  @override
  Widget build(BuildContext context) {

    controller.loadSubject();
    return Scaffold(
        appBar: CbtAppBar(
          title: title,
        ),
        body: Obx(
          () => controller.flashCardListCopy.isEmpty
              ? Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CBTLoaderProgress(
                        isImage: false,
                        isGif: true,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: homeBody(context),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
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
                child: controller.flashCardListCopy.isEmpty
                    ? Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CBTLoaderProgress(
                              isImage: false,
                              isGif: true,
                            ),
                          ),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Visibility(
                              visible:
                                  controller.flashCardListCopy.value.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: recentVideo(
                                    controller.flashCardListCopy.value,
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
                child: controller.flashCardListCopy.isEmpty
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
                                  controller.flashCardListCopy.value.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: recentVideo(
                                    controller.flashCardListCopy.value,
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

  recentVideo(List<FlashCardGridModel> value, BuildContext context) {
    List<Widget> videoWidget = List.empty(growable: true);
    value.forEach((element) {
      videoWidget.add(InkWell(
        onTap: () {
          controller.loadSubjectClick(bookID:element.prBookId!.toString());
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
                        width: 100,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(element
                                    .prSubject!.prIconPath ??
                                element.prCategory!.prIconPath ??
                                "http://demo.codebright.in/media/recent-img.png"),
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
                      CBTTextNew(
                        element.prName!,
                        style: TStyle.f10_B
                            .styleWith(fontFamily: AppFontsNeo.leagueBold),
                      ),
                      SizedBox(height: 8),
                      CBTTextNew(
                        element.prSubject!.prName!,
                        style: TStyle.f10_S.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                        maxLine: 5,
                      ),
                      SizedBox(height: 8),
                      CBTTextNew(
                        element.prCategory!.prName!,
                        style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                        maxLine: 5,
                      ),
                      SizedBox(height: 8),
                      CBTTextNew(
                        element.prClass!.prName ?? "",
                        style: TStyle.f10_S.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                        maxLine: 5,
                      ),
                      SizedBox(height: 8),
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
