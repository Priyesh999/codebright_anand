import 'package:carousel_slider/carousel_slider.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_expansion_tile.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_student/cbt_student_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_student/cbt_student_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/cbt_toast/cbt_toast.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../cbt_helpers/dxwidget/codebright_text.dart';
import '../../../../../utils/appIcons.dart';
import '../../../../online_learn/vcb_model.dart';
import '../../cbt_video/player_type_enum.dart';
import '../../cbt_video/video_view.dart';

class TopicView extends GetView<StudentController> {
  DigiGyanModel cbtCommonModel;
  CbtPlayerType typeView;
  VcbTechModel? vcbTechModel;
  RxString selectedTitle = "".obs;
  RxString selectedDescription = "".obs;
  bool isTable;
  String sharedValue = "  Company Information  ";

  TopicView(this.cbtCommonModel, this.typeView,
      {Key? key, this.isTable = false, this.vcbTechModel = null});

  late YoutubePlayerController _youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(vcbTechModel!
          .data!
          .prVideoData![controller.isSelectedPosition.value]
          .prVideo!
          .prVideoUrl!) as String,
      flags: const YoutubePlayerFlags(
        startAt: 0,
      ),
    );
    return Obx(() => controller.isLoading.value
        ? SizedBox()
        : Scaffold(
            appBar: CbtAppBar(
              title: cbtCommonModel.title.toTitleCase,
            ),
            body: Obx(
                () => controller.isNative.value ? widget_col() : widget_col()),
          ));
  }

  Widget companyList(bool isEdit, bool isTable, VcbTechModel? vcbTechModel) {
    return vcbTechModel!.data!.prVideoData!.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: vcbTechModel.data!.prVideoData!.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      controller.isNative.value = true;
                      if (vcbTechModel.data!.prVideoData![index].prVideo!
                          .prVideoUrl!.isNotEmpty) {
                        _youtubePlayerController.load(
                            YoutubePlayer.convertUrlToId(vcbTechModel.data!
                                    .prVideoData![index].prVideo!.prVideoUrl ??
                                "") as String);
                      } else {
                        CboToast.showText(text: "Video Data not Available");
                      }

                      controller.isNative.value = false;
                    },
                    child: Obx(
                      () => controller.isNative.value
                          ? SizedBox(
                              // height: 200,
                              child: StudentItemVcb(
                                typeView: typeView,
                                isEdit: isEdit,
                                isTable: isTable,
                                isAdd: controller.isAdd.value,
                                post: vcbTechModel.data!.prVideoData![index],
                                controller: controller,
                                index: index,
                                isSelectedPosition:
                                    controller.isSelectedPosition.value,
                              ),
                            )
                          : SizedBox(
                              // height: 200,
                              child: StudentItemVcb(
                                typeView: typeView,
                                isEdit: isEdit,
                                isTable: isTable,
                                isAdd: controller.isAdd.value,
                                post: vcbTechModel.data!.prVideoData![index],
                                controller: controller,
                                index: index,
                                isSelectedPosition:
                                    controller.isSelectedPosition.value,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Center(
            child: EmoticonsView(
              text: "${"No Data Found".tr} ",
            ),
          );
  }

  Widget widget_col() {
    return Column(
      children: [
        YoutubePlayerBuilder(
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
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 100.0),
                    //   child: player,
                    // ),
                    player

                  ],
                ),
              );
            }),
        Expanded(
            child:
          //   Column(
          // children: [
          //   Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Padding(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
          //         child: const Icon(Icons.bookmark_border),
          //       ),
          //     ],
          //   ),

            Visibility(visible:true,child: companyList(true, isTable, vcbTechModel)),
          // ],
        // )
    ),
      ],
    );
  }
}
