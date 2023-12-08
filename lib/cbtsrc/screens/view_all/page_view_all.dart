import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/recent_model.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/watch_list_model.dart';
import 'package:digigyan/cbtsrc/screens/view_all/controller_view_all.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widgets/default_app_baar.dart';

class ViewListPage extends GetView<ViewAllController> {
  String title;
  TypeScreen typeScreen;

  ViewListPage({this.title = "Video", this.typeScreen = TypeScreen.CBT_VIDEO});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CbtAppBar(
        title: title,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: homeBody(context, typeScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeBody(BuildContext context, TypeScreen typeScreen) {
    return Container(
      child: GetPlatform.isWeb || GetPlatform.isWindows
          ? _web(context, typeScreen)
          : _mobile(context, typeScreen),
    );
  }

  Widget _web(BuildContext context, TypeScreen typeScreen) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Visibility(
                        visible: typeScreen == TypeScreen.CBT_VIDEO,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: getVideoList(
                              controller.videoList.value,
                              context,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: typeScreen == TypeScreen.CBT_PDF,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: getPdfList(
                              controller.pdfList.value,
                              context,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Visibility(
              //           visible: typeScreen == TypeScreen.CBT_SIMULATION,
              //           child: Padding(
              //             padding: const EdgeInsets.only(top: 10.0),
              //             child: Column(
              //               children: getSimulationList(
              //                 controller.simulationList.value,
              //                 context,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Visibility(
              //           visible: typeScreen == TypeScreen.CBT_FLIP,
              //           child: Padding(
              //             padding: const EdgeInsets.only(top: 10.0),
              //             child: Column(
              //               children: getPdfList(
              //                 controller.pdfList.value,
              //                 context,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          )),
        ),
      ],
    );
  }

  Widget _mobile(BuildContext context, TypeScreen typeScreen) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible: typeScreen == TypeScreen.CBT_VIDEO,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: getVideoList(
                        controller.videoList.value,
                        context,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: typeScreen == TypeScreen.CBT_FLIP,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: getPdfList(
                        controller.pdfList.value,
                        context,
                      ),
                    ),
                  ),
                ),
                // Visibility(
                //   visible: typeScreen == TypeScreen.CBT_SIMULATION,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 10.0),
                //     child: Column(
                //       children: getSimulationList(
                //         controller.simulationList.value,
                //         context,
                //       ),
                //     ),
                //   ),
                // ),
                Visibility(
                  visible: typeScreen == TypeScreen.CBT_PDF,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: getPdfList(
                        controller.pdfList.value,
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
    );
  }

  List<Widget> getVideoList(List<PrVodeoDatum> value, BuildContext context) {
    List<Widget> videoWidget = List.empty(growable: true);
    value.forEach((element) {
      videoWidget.add(Container(
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
                                          element.prVideoUrl!) ??
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
                      element.prName!,
                      style: TStyle.f10_B
                          .styleWith(fontFamily: AppFontsNeo.leagueBold),
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prBook!.prName!,
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
                      element.prDescription ?? "",
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
      ));
    });

    return videoWidget;
  }

  List<Widget> getPdfList(List<PrPdfDatum> value, BuildContext context) {
    List<Widget> videoWidget = List.empty(growable: true);
    value.forEach((element) {
      videoWidget.add(Container(
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
                          image: NetworkImage(ApiUrls.baseUrlImage(
                              element.prBook?.prIcon!)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
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
                      element.prName ?? "",
                      style: TStyle.f10_B
                          .styleWith(fontFamily: AppFontsNeo.leagueBold),
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prBook?.prName ?? "",
                      style: TStyle.f10_S.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                      maxLine: 5,
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prCategory?.prName ?? "",
                      style: TStyle.f10_S.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                      maxLine: 5,
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prDescription ?? "",
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
                    // SizedBox(height: 8),
                  ],
                ),
              ),
            )
          ],
        ),
      ));
    });

    return videoWidget;
  }

// List<Widget> getSimulationList(
//     List<PrSimulationDatum> value, BuildContext context) {
//   List<Widget> videoWidget = List.empty(growable: true);
//   value.forEach((element) {
//     videoWidget.add(Container(
//       margin: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         //DecorationImage
//         // border: Border.all(
//         //   color: Colors.red.shade100,
//         //   width: 1,
//         // ), //Border.all
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.red.shade50,
//             offset: const Offset(
//               0.5,
//               0.5,
//             ), //Offset
//             blurRadius: 5.0,
//             spreadRadius: 1.0,
//           ), //BoxShadow
//           BoxShadow(
//             color: Colors.white,
//             offset: const Offset(0.0, 0.0),
//             blurRadius: 0.0,
//             spreadRadius: 0.0,
//           ), //BoxShadow
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//               height: 150,
//               width: 150,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   ClipRRect(
//                       child: Container(
//                     width: 150,
//                     margin: const EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                       image: DecorationImage(
//                         image: NetworkImage(ApiUrls.baseUrlImage(
//                             element.prBook?.prBookFile ??
//                                 element.prCategory?.prIconPath ??
//                                 "")),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   )),
//                 ],
//               )),
//           SizedBox(width: 5),
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 top: 12,
//                 right: 12,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CBTTextNew(
//                     element.prName ?? "",
//                     style: TStyle.f10_B
//                         .styleWith(fontFamily: AppFontsNeo.leagueBold),
//                   ),
//                   SizedBox(height: 8),
//                   CBTTextNew(
//                     element.prBook?.prName ?? "",
//                     style: TStyle.f10_S.styleWith(
//                       fontFamily: AppFontsNeo.leagueBold,
//                     ),
//                     maxLine: 5,
//                   ),
//                   SizedBox(height: 8),
//                   CBTTextNew(
//                     element.prCategory?.prName ?? "",
//                     style: TStyle.f10_S.styleWith(
//                       fontFamily: AppFontsNeo.leagueBold,
//                     ),
//                     maxLine: 5,
//                   ),
//                   SizedBox(height: 8),
//                   CBTTextNew(
//                     element.prDescription ?? "",
//                     style: TStyle.f10_S.styleWith(
//                       fontFamily: AppFontsNeo.leagueBold,
//                     ),
//                     maxLine: 5,
//                   ),
//                   // Container(
//                   //   alignment: Alignment.centerRight,
//                   //   child: ElevatedButton(
//                   //       onPressed: () {
//                   //         Get.to(() => NuggetsScreen(currentIndex:isSelectedPosition));
//                   //         // gotoYoutubePlayer(
//                   //         //     videourl: post.image,
//                   //         //     appBarName: post.title,
//                   //         //     description: topicModel!.prDescription!);
//                   //       },
//                   //       style: MethodUtils.raisedButtonStyle(
//                   //           materialPrimaryColor),
//                   //       child: DxTextWhite(
//                   //         "View More",
//                   //         mBold: true,
//                   //       )),
//                   // ),
//                   // SizedBox(height: 8),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   });
//
//   return videoWidget;
// }
}
