import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/presentation_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/video_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/player_type_enum.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/video_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../constants/api_urls.dart';
import '../../../../utils/appImages.dart';

class VideoItem extends StatelessWidget {
  final DigiGyanModel post;
  final bool isEdit;
  final bool isTable;
  final bool isAdd;
  final int index;
  final bool isImage;
  final VideoController controller;
  final CbtPlayerType cbtPlayer;
  final int isSelectedPosition;

  VideoModel? topicModel;
  SimulationModel? smModel;

  VideoItem(
      {Key? key,
      required this.post,
      required this.isEdit,
      required this.index,
      required this.controller,
      required this.cbtPlayer,
      required this.isSelectedPosition,
      this.isImage = false,
      this.isTable = false,
      required this.isAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cbtPlayer == CbtPlayerType.CBT_VIDEO) {
      topicModel = post.originalModel as VideoModel;
    } else {
      smModel = post.originalModel as SimulationModel;
    }

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
            color: Colors.red.shade100,
            offset: const Offset(
              1.0,
              1.0,
            ), //Offset
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: isSelectedPosition == index ? Colors.green : Colors.white,
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
                    // borderRadius: BorderRadius.circular(6.0),
                    child: cbtPlayer == CbtPlayerType.CBT_VIDEO
                        ? Container(
                            width: 150,
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    YoutubePlayer.getThumbnail(
                                        videoId: YoutubePlayer.convertUrlToId(
                                                post.image) ??
                                            '')),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: ApiUrls.baseUrlImage(post.image),
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                cbtPlayer == CbtPlayerType.CBT_PDF
                                    ? AppImages.pdf
                                    : AppImages.simulation,
                                height: 150,
                                // width: 35,
                              ),
                            ),
                            fit: BoxFit.fill,
//        fit: widget.imageHeight > 0 ? BoxFit.cover : BoxFit.fitWidth,
                          ),
                  ),
                  Visibility(
                    visible: cbtPlayer == CbtPlayerType.CBT_VIDEO,
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
                    post.title,
                    style: TStyle.f18_B
                        .styleWith(color: CodebrightColor.cbtPrimarColor),
                  ),
                  SizedBox(height: 8),
                  CBTTextNew(
                    cbtPlayer == CbtPlayerType.CBT_VIDEO
                        ? topicModel!.prDescription
                        : smModel!.prDescription,
                    style: TStyle.f18_B
                        .styleWith(color: CodebrightColor.cbtPrimarColor),
                  ),
                  SizedBox(height: 8),
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
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //   child: SizedBox(
    //     width: MediaQuery.of(context).size.width,
    //     child: IntrinsicHeight(
    //       child: Row(
    //         children: [
    //           Container(
    //             width: 120,
    //             margin: const EdgeInsets.only(
    //                 top: 16.0, bottom: 16.0, left: 12.0, right: 12.0),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10.0),
    //               image: DecorationImage(
    //                 image: CachedNetworkImageProvider(
    //                     YoutubePlayer.getThumbnail(
    //                         videoId: YoutubePlayer.convertUrlToId(post.image) ??
    //                             '')),
    //                 fit: BoxFit.fill,
    //               ),
    //             ),
    //             child: Center(
    //               child: Stack(
    //                 children: [
    //                   Align(
    //                     alignment: const Alignment(0, 0),
    //                     child: Image.asset(
    //                       CommonImages().imglandingCrashCoursePlayButton,
    //                       width: 35,
    //                     ),
    //                   ),
    //                   if (timeInside)
    //                     MoodleAPIService().checkIfDurationExistsLocally(
    //                             nuggetData.videoURL)
    //                         ? Align(
    //                             alignment: const Alignment(1, 1),
    //                             child: Padding(
    //                               padding: const EdgeInsets.symmetric(
    //                                   horizontal: 8.0, vertical: 8.0),
    //                               child: LearnCommonWidget().watchAndTime(
    //                                 image: CommonImages().imgTime,
    //                                 time: MoodleAPIService()
    //                                     .getVideoDurationFromLocalStorage(
    //                                         nuggetData.videoURL),
    //                                 showColor: false,
    //                               ),
    //                             ),
    //                           )
    //                         : FutureBuilder(
    //                             future: MoodleAPIService()
    //                                 .getVideoDurartionFromApi(
    //                                     nuggetData.videoURL),
    //                             builder: (context, snapshot) {
    //                               if (snapshot.hasData) {
    //                                 return Align(
    //                                   alignment: const Alignment(1, 1),
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.symmetric(
    //                                         horizontal: 8.0, vertical: 8.0),
    //                                     child: LearnCommonWidget().watchAndTime(
    //                                       image: CommonImages().imgTime,
    //                                       time: snapshot.data as String,
    //                                       showColor: false,
    //                                     ),
    //                                   ),
    //                                 );
    //                               } else {
    //                                 return SizedBox();
    //                               }
    //                             }),
    //                   // if (courseNum != null)
    //                   //   Align(
    //                   //     alignment: const Alignment(1, -1),
    //                   //     child: Container(
    //                   //       decoration: BoxDecoration(
    //                   //         color: CommonColor().whiteSmog,
    //                   //         borderRadius: const BorderRadius.only(
    //                   //           bottomLeft: Radius.circular(10.0),
    //                   //           topRight: Radius.circular(10.0),
    //                   //         ),
    //                   //       ),
    //                   //       padding: const EdgeInsets.symmetric(
    //                   //           vertical: 4.0, horizontal: 8.0),
    //                   //       child: Text(
    //                   //         (index + 1).toString(),
    //                   //         style: const TextStyle(
    //                   //           fontWeight: FontWeight.bold,
    //                   //           fontSize: 24.0,
    //                   //         ),
    //                   //       ),
    //                   //     ),
    //                   //   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: Padding(
    //               padding: const EdgeInsets.symmetric(
    //                   horizontal: 8.0, vertical: 16.0),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     nuggetData.name,
    //                     maxLines: 2,
    //                     textScaleFactor: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: const TextStyle(
    //                       fontSize: 14.0,
    //                       fontWeight: FontWeight.w700,
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 8.0,
    //                   ),
    //                   // if (chapNumber != null) ...[
    //                   //   Text(
    //                   //     chapNumber! + " Chapter",
    //                   //     style: const TextStyle(
    //                   //       fontSize: 12.0,
    //                   //       fontWeight: FontWeight.w500,
    //                   //     ),
    //                   //   ),
    //                   //   const SizedBox(
    //                   //     height: 8.0,
    //                   //   ),
    //                   // ],
    //                   Text(
    //                     Bidi.stripHtmlIfNeeded(nuggetData.description).trim(),
    //                     textScaleFactor: 1,
    //                     style: const TextStyle(
    //                       fontSize: 11.0,
    //                       fontWeight: FontWeight.w700,
    //                     ),
    //                     overflow: TextOverflow.ellipsis,
    //                     maxLines: 2,
    //                   ),
    //                   const SizedBox(
    //                     height: 16.0,
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       if (!timeInside)
    //                         MoodleAPIService().checkIfDurationExistsLocally(
    //                                 nuggetData.videoURL)
    //                             ? LearnCommonWidget().watchAndTime(
    //                                 image: CommonImages().imgTime,
    //                                 time: MoodleAPIService()
    //                                     .getVideoDurationFromLocalStorage(
    //                                         nuggetData.videoURL),
    //                                 showColor: true,
    //                               )
    //                             : FutureBuilder(
    //                                 future: MoodleAPIService()
    //                                     .getVideoDurartionFromApi(
    //                                         nuggetData.videoURL),
    //                                 builder: (context, snapshot) {
    //                                   if (snapshot.hasData) {
    //                                     return LearnCommonWidget().watchAndTime(
    //                                       image: CommonImages().imgTime,
    //                                       time: snapshot.data as String,
    //                                       showColor: true,
    //                                     );
    //                                   } else {
    //                                     return const SizedBox();
    //                                   }
    //                                 },
    //                               ),
    //                       // if (!timeInside)
    //                       //   LearnCommonWidget().watchAndTime(
    //                       //     image: CommonImages().imgTime,
    //                       //     time: "31 Sec",
    //                       //     showColor: true,
    //                       //   ),
    //                       Expanded(
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.end,
    //                           children: [
    //                             ...LearnCommonWidget().widgetLikeShare(
    //                               isLiked: false,
    //                               likeColor: CommonColor().loaderColor,
    //                               shareColor: CommonColor().greyShade1,
    //                               borderLikeColor: CommonColor().greyShade1,
    //                               callBack: () {
    //                                 CommonMethod().shareUniv(
    //                                   '${CommonString().deepLinkingSchemeAndHost}type=learn&sub=nugget&nuggetId=${nuggetData.id}',
    //                                   generateDynamicLinkAndShare: true,
    //                                   contentPresent: true,
    //                                   content:
    //                                       'I just learnt some stuff about finance and I\'m feeling pretty smart! Give it a try?',
    //                                 );
    //                                 learnDataController
    //                                     .triggerMoEngageLearnEvent(
    //                                         MoEngageLearnEvent.nuggetsShared,
    //                                         id: nuggetData.id,
    //                                         nuggetTitle: nuggetData.name);
    //                               },
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  List<Widget> getRowData(List<CbtHeaderModel?> list, bool isEdit, int index) {
    List<Widget> data = List.empty(growable: true);

    for (var element in list) {
      String txtData =
          element!.title == "SrNo" ? (index + 1).toString() : element.value;
      data.add(Expanded(
          flex: element.flex,
          child: CBTTextNew(txtData,
              style: TStyle.f16_B.styleWith(color: CodebrightColor.black),
              textAlign: TextAlign.start)));
    }
    return data;
  }

  Widget buttons(String name, IconData icon, int index, int isPosition,
      {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: index == isPosition ? Colors.white : Colors.black,
          ),
          SizedBox(height: 8),
          index == isPosition
              ? DxTextWhite(
                  name,
                  mSize: 20,
                  mBold: true,
                )
              : DxTextBlack(
                  name,
                  mSize: 20,
                  mBold: true,
                )
        ],
      ),
    );
  }

  List<Widget> getDataCard(
      List<CbtHeaderModel?> list, bool isEdit, int index, bool isSelected) {
    List<Widget> data = List.empty(growable: true);

    for (var element in list) {
      if (element!.title != "SrNo") {
        if (element.title == "Name") {
          data.add(Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CBTTextNew(
                    element.value.toTitleCase,
                    style: TStyle.f16_B.styleWith(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ));
        } else {
          data.add(Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CBTTextNew(
                    element.title.toTitleCase,
                    style: TStyle.f16_B.styleWith(
                      color: CodebrightColor.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: CBTTextNew(
                    "  :  ${element.value.toTitleCase}",
                    style: TStyle.f16_B.styleWith(
                      color: CodebrightColor.black,
                    ),
                  ),
                ),
              ],
            ),
          ));
        }
      }
    }
    return data;
  }
}
