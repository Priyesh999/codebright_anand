import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/topic_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_student/cbt_student_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/player_type_enum.dart';
import 'package:digigyan/cbtsrc/screens/online_learn/vcb_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../../cbt_helpers/dxwidget/codebright_text.dart';
import '../../../../cbt_mobile/dashboard/recent_model.dart';

class StudentItem extends StatelessWidget {
  final DigiGyanModel post;
  final CbtPlayerType typeView;
  final bool isEdit;
  final bool isTable;
  final bool isAdd;
  final int index;
  final bool isImage;
  final StudentController controller;
  final int isSelectedPosition;

  TopicModel? topicModel;

  StudentItem(
      {Key? key,
      required this.post,
      required this.typeView,
      required this.isEdit,
      required this.index,
      required this.controller,
      required this.isSelectedPosition,
      this.isImage = false,
      this.isTable = false,
      required this.isAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    topicModel = post.originalModel as TopicModel;
    return Container(
      height: 200,
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
            color: Colors.teal.shade100,
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
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width - 35,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: GetPlatform.isWeb
                  ? OctoImage(
                      image: NetworkImage(post.image),
                      progressIndicatorBuilder: (context, progress) {
                        double? value;
                        var expectedBytes = progress?.expectedTotalBytes;
                        if (progress != null && expectedBytes != null) {
                          value =
                              progress.cumulativeBytesLoaded / expectedBytes;
                        }
                        return CircularProgressIndicator(value: value);
                      },
                      errorBuilder: (context, error, stacktrace) =>
                          const Icon(Icons.error),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: ApiUrls.baseUrlImage(post.image),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          typeView == CbtPlayerType.CBT_PDF
                              ? AppImages.pdf
                              : typeView == CbtPlayerType.CBT_VIDEO
                                  ? AppImages.video
                                  : AppImages.simulation,
                          height: 200,
                          // width: 35,
                        ),
                        fit: BoxFit.fill,
//        fit: widget.imageHeight > 0 ? BoxFit.cover : BoxFit.fitWidth,
                      ),
                    ),
            ),
          ),
          Positioned(
              bottom: 8,
              left: 1,
              right: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: typeView == CbtPlayerType.CBT_PDF,
                    child: buttons("${topicModel!.pdfCount} PDF",
                        CupertinoIcons.check_mark, index, isSelectedPosition,
                        onTap: () => {}
                        /*  openScreenAsLeftToRight(context,
                            PdfScreen(widget.studentID, chapters[i].id!))*/
                        ),
                  ),
                  Visibility(
                    visible: typeView == CbtPlayerType.CBT_VIDEO,
                    child: buttons(
                      "${topicModel!.videoCount} Video",
                      CupertinoIcons.play_circle_fill, index,
                      isSelectedPosition,
                      onTap: () => {
                        // Get.off(VideoView(
                        //     post, "video-list", CbtPlayerType.CBT_VIDEO))
                      },
                      // openScreenAsLeftToRight(
                      //     context,
                      //     VideosScreen(
                      //         studentID: widget.studentID,
                      //         chapterID: chapters[i].id!)
                    ),
                  ),
                  Visibility(
                    visible: typeView == CbtPlayerType.CBT_SIMULATION,
                    child: buttons(
                      "${topicModel!.prSimulationCount} Simulation",
                      CupertinoIcons.ellipsis_vertical_circle_fill,
                      index,
                      isSelectedPosition,
                      onTap: () => {
                        // Get.off(VideoView(post, "simulation-list",
                        //     CbtPlayerType.CBT_SIMULATION))
                      },
                    ),
                  ),
                ],
              )),
          Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: CBTTextNew(
                post.title,
                style:
                    TStyle.f16_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
                maxLine: 10,
              )),
        ],
      ),
    );
  }

  Widget buttons(String name, IconData icon, int index, int isPosition,
      {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: index == isPosition ? Colors.white : Colors.black,
          ),
          SizedBox(height: 8),
          index == isPosition
              ? CBTTextNew(
                  name,
                  style: TStyle.f8_B.styleWith(
                      fontFamily: AppFontsNeo.leagueBold, color: Colors.white),
                )
              : CBTTextNew(
                  name,
                  style:
                      TStyle.f8_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
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
                        color: isSelected ? Colors.white : Colors.black),
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
                    style: TStyle.f16_B.style,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: CBTTextNew(
                    "  :  ${element.value.toTitleCase}",
                    style: TStyle.f16_B.style,
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

class StudentItemVcb extends StatelessWidget {
  final PrVideoDatum? post;
  final CbtPlayerType typeView;
  final bool isEdit;
  final bool isTable;
  final bool isAdd;
  final int index;
  final bool isImage;
  final StudentController controller;
  final int isSelectedPosition;

  StudentItemVcb(
      {Key? key,
      this.post = null,
      required this.typeView,
      required this.isEdit,
      required this.index,
      required this.controller,
      required this.isSelectedPosition,
      this.isImage = false,
      this.isTable = false,
      required this.isAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: isSelectedPosition == index ? Colors.teal.shade100 : Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: CBTTextNew(
            post!.prName!,
            style: TStyle.f16_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
          ),
          subtitle: CBTTextNew(
            post!.prDescription!,
            style: TStyle.f12_R.styleWith(fontFamily: AppFontsNeo.leagueBold),
          ),
        ),
      ),
    );
  }
}
