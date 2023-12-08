import 'package:carousel_slider/carousel_slider.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_expansion_tile.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/player_type_enum.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/video_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/video_item.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appIcons.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VideoView extends GetView<VideoController> {
  DigiGyanModel cbtCommonModel;
  CbtPlayerType cbtPlayer;
  bool isTable;
  String sharedValue = "  Company Information  ";
  String apiUrl = "";

  VideoView(this.cbtCommonModel, this.apiUrl, this.cbtPlayer,
      {Key? key, this.isTable = false});

  final List<GlobalKey<AppExpansionTileState>> _itemExpansionKeys = [];

  @override
  Widget build(BuildContext context) {
    // controller_view_all.dart.setMenuModel(cbtCommonModel);
    controller.setUserDetails(cbtPlayer);
    controller.setMenuModel(cbtCommonModel, apiUrl, cbtPlayer);
    controller.isNative.value = false;
    return Scaffold(
      appBar: CbtAppBar(
        title: cbtCommonModel.title.toTitleCase,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // if (controller_view_all.dart.isSelectedPosition.value != 10000) {
            //   if (cbtPlayer == CbtPlayerType.CBT_SIMULATION) {
            //     Get.to(() => CbtWebView(
            //           title: controller_view_all.dart
            //               .cbtCommonList
            //               .value[controller_view_all.dart.isSelectedPosition.value]!
            //               .title,
            //           url:controller_view_all.dart
            //               .cbtCommonList
            //               .value[controller_view_all.dart.isSelectedPosition.value]!.image,
            //         ));
            //   } else {
            //     if (GetPlatform.isWeb) {
            //       Get.to(() => YoutubeViewer());
            //     } else {
            //       Get.to(() => NuggetsScreen(
            //           currentIndex: controller_view_all.dart.isSelectedPosition.value));
            //     }
            //   }
            // } else {
            Get.back();
            // }
          },
          backgroundColor: controller.isSelectedPosition.value != 10000
              ? CodebrightColor.cbtPrimarColor
              : Colors.red,
          child: controller.isSelectedPosition.value != 10000
              ? const Icon(
                  Icons.send,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.cancel,
                  color: Colors.white,
                )),
      body: Obx(
        () => Column(
          children: [
            subjectImage(context, cbtCommonModel.image),
            Expanded(child: companyList(true, isTable)),
          ],
        ),
      ),
    );
  }

  subjectImage(BuildContext context, String image) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CarouselSlider(
          items: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 150,
              //BoxDecoration Widget
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(ApiUrls.cbtBaseUrl(image)),
                  fit: BoxFit.fill,
                ), //DecorationImage
                border: Border.all(
                  color: Colors.lightGreenAccent,
                  width: 1,
                ), //Border.all
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.lightGreenAccent,
                  //   offset: const Offset(
                  //     1.0,
                  //     1.0,
                  //   ), //Offset
                  //   blurRadius: 10.0,
                  //   spreadRadius: 2.0,
                  // ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ), //BoxDecoration
            ),
          ],
          options: CarouselOptions(
            height: /*GetPlatform.isWeb?700:*/ 200,
            // aspectRatio: 16 / 9,
            aspectRatio: 2.0,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInCirc,
            enlargeCenterPage: true,
            enlargeFactor: /*GetPlatform.isWeb?0.5:*/ 0.2,
            // onPageChanged: callbackFunction,
            scrollDirection: /*GetPlatform.isWeb?Axis.vertical:*/
                Axis.horizontal,
          )),
    );
  }

  Widget companyList(bool isEdit, bool isTable) {
    _itemExpansionKeys.addAll(List.generate(
        controller.cbtCommonList.value.length, (index) => GlobalKey()));
    return Obx(
      () => controller.cbtCommonList.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: GetPlatform.isWeb
                        ? GridView.builder(
                            gridDelegate: GetPlatform.isWeb
                                ? const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4)
                                : const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: controller.cbtCommonList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => {
                                controller.onUpdateListClick(
                                    index, controller.cbtCommonList[index]!.id,
                                    isView: true,
                                    isDelete: false,
                                    isEditable: true),

                                // controller.onReady()
                              },
                              child: Obx(
                                () => SizedBox(
                                  // height: 200,
                                  child: VideoItem(
                                    cbtPlayer: cbtPlayer,
                                    isEdit: isEdit,
                                    isTable: isTable,
                                    isAdd: controller.isAdd.value,
                                    post: controller.cbtCommonList[index]!,
                                    controller: controller,
                                    index: index,
                                    isSelectedPosition:
                                        controller.isSelectedPosition.value,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.cbtCommonList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => {
                                controller.onUpdateListClick(
                                    index, controller.cbtCommonList[index]!.id,
                                    isView: true,
                                    isDelete: false,
                                    isEditable: true),
                              },
                              child: Obx(
                                () => VideoItem(
                                  cbtPlayer: cbtPlayer,
                                  isEdit: isEdit,
                                  isTable: isTable,
                                  isAdd: controller.isAdd.value,
                                  post: controller.cbtCommonList[index]!,
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
            ),
    );
  }

  List<Widget> getWidget(List<CbtHeaderModel?> list, bool isExpanded) {
    List<Widget> data = List.empty(growable: true);
    list.forEach((element) {
      data.add(Expanded(
          flex: element!.flex,
          child: CBTTextNew(element.title.toTitleCase,
              style: TStyle.f16_B.styleWith(color: CodebrightColor.black),
              color: Colors.black,
              textAlign: TextAlign.start)));
    });

    data.add(Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: !isExpanded,
          child: CboIconBtn(
            color: Colors.white24,
            onPress: () {},
            child: const Icon(
              AppIcons.edit,
              color: Colors.white24,
              size: 22,
            ),
          ),
        ),
        Visibility(
          visible: !isExpanded,
          child: CboIconBtn(
            color: Colors.white24,
            onPress: () {},
            child: const Icon(
              Icons.remove_red_eye,
              color: Colors.white24,
              size: 22,
            ),
          ),
        ),
        Visibility(
          visible: true,
          child: CboIconBtn(
            color: Colors.white24,
            onPress: () async {},
            child: const Icon(
              AppIcons.delete,
              color: Colors.white24,
              size: 20,
            ),
          ),
        ),
      ],
    ));
    return data;
  }

  _openForm(MenuModel menuModel) {
    if (menuModel.prMenuCode == SubMenuCode.checkIN) {
    } else if (menuModel.prMenuCode == SubMenuCode.checkOUT) {
    } else if (menuModel.prMenuCode == SubMenuCode.dwrPlanCode) {
      // return DwrPlanView(menuModel);
    } else if (menuModel.prMenuCode == SubMenuCode.visitCode ||
        menuModel.prMenuCode == SubMenuCode.doctorCode ||
        menuModel.prMenuCode == SubMenuCode.visitTrackCode) {
      // return DwrPlanView(menuModel);
    } else if (menuModel.prMenuCode == SubMenuCode.visitSubmitCode) {
      // return DwrPlanView(menuModel);
    } else if (menuModel.prMenuCode == SubMenuCode.expenseCode) {
      // return DwrPlanView(menuModel);
    } else {
      // return CbtWebView(
      //     url: CBTUrlByMenu.getUrlByMenu(
      //         menu:null,
      //         formId: controller_view_all.dart.isEditable.value &&
      //                 controller_view_all.dart.isSelectedPosition.value != 10000
      //             ? controller_view_all.dart.id.value
      //             : "",
      //         employeeId: controller_view_all.dart.userId.value));

      return Container();
    }
  }
}
