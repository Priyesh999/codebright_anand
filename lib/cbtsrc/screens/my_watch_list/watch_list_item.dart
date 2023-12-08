import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/controller_flash.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/flash_model.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/controller_watchlist.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/watch_list_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchListItem extends StatelessWidget {
  final WatchListModel post;
  final int index;
  final WatchListController controller;
  final int isSelectedPosition;

  const WatchListItem({
    Key? key,
    required this.post,
    required this.index,
    required this.controller,
    required this.isSelectedPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                                        post.prViewUrl!) ??
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
                  CBTTextNew(
                    post.prTopic!.prName!,
                    style: TStyle.f10_B
                        .styleWith(fontFamily: AppFontsNeo.leagueBold),
                  ),
                  SizedBox(height: 8),
                  CBTTextNew(
                    post.prBook!.prName!,
                    style: TStyle.f10_S.styleWith(
                      fontFamily: AppFontsNeo.leagueBold,
                    ),
                    maxLine: 5,
                  ),
                  SizedBox(height: 8),
                  CBTTextNew(
                    post.prCategory!.prName!,
                    style: TStyle.f10_B.styleWith(
                      fontFamily: AppFontsNeo.leagueBold,
                    ),
                    maxLine: 5,
                  ),
                  SizedBox(height: 8),
                  CBTTextNew(
                    "Class " + post.prClass!.prName!,
                    style: TStyle.f10_S.styleWith(
                      fontFamily: AppFontsNeo.leagueBold,
                    ),
                    maxLine: 5,
                  ),
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   child: ElevatedButton(
                  //       onPressed: () {
                  //         Get.to(() => NuggetsScreen(currentIndex:isSelectedPosition));
                  //         // gotoYoutubePlayer(
                  //         //     videourl: post.image,
                  //         //     appBarName: post.title,
                  //         //     description: topicModel!.prDescription!);
                  //       },
                  //       style: MethodUtils.raisedButtonStyle(
                  //           materialPrimaryColor),
                  //       child: DxTextWhite(
                  //         "View More",
                  //         mBold: true,
                  //       )),
                  // ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
