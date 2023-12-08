import 'package:digigyan/cbtsrc/cbt_helpers/app_expansion_tile.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_buttons.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_input_fields.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_model/cbt_drop_down.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_app_ex_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/cbt_webview/cbt_webview.dart';
import 'package:digigyan/cbtsrc/screens/widgets/pagination_web/flutter_web_pagination.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/appIcons.dart';

class CbtLFView extends GetView<CbtLFController> {
  MenuModel menuModel;
  String sharedValue = "  Company Information  ";

  CbtLFView(this.menuModel, {Key? key});

  final List<GlobalKey<AppExpansionTileState>> _itemExpansionKeys = [];

  @override
  Widget build(BuildContext context) {
    controller.setMenuModel(menuModel, 1, "");
    controller.setUserID();
    return Obx(() => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (controller.isAdd.value) {
                if (controller.isView.value) {
                  controller.isView.value = false;
                  controller.isAdd.value = false;
                } else {
                  controller.saveData();
                }
              } else {
                openFilterSheet();
              }
            },
            backgroundColor:
                controller.isDelete.value ? Colors.red : Colors.teal,
            child: Obx(() => controller.isBtnLoading.value
                ? const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : controller.isAdd.value
                    ? controller.isView.value
                        ? const Icon(
                            Icons.backspace_rounded,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.send,
                            color: Colors.white,
                          )
                    : const Icon(
                        Icons.filter_alt_sharp,
                        color: Colors.white,
                      )),
          ),
          bottomSheet: Row(
            children: [
              Container(
                height: 30,
                width: 350,
                // color: Colors.grey[300],
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(width: 10),
                    // Expanded(
                    //   flex: 1,
                    //   child: SizedBox(
                    //     height: 25,
                    //     child: CBTText(""),
                    //   ),
                    // ),
                    // Expanded(
                    //   flex: 2,
                    /*child:*/ SizedBox(
                      height: 26,
                      width: 50,
                      child: CodebrightBrightButton(
                        text: "📁",
                        textSize: 16,
                        bgColor: Colors.white,
                        borderColor: Colors.teal,
                        textColor: Colors.teal,
                        onPressed: () => {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    // ),
                    // Expanded(
                    //   flex: 1,
                    //   child: SizedBox(
                    //     height: 25,
                    //     child: CBTText(""),
                    //   ),
                    // ),
                    /*  Expanded(
                  flex: 2,
                  child:*/
                    SizedBox(
                      height: 26,
                      width: controller.isAdd.value ? 100 : 50,
                      child: CodebrightBrightButton(
                        text: controller.isAdd.value ? "Back" : "+",
                        textSize: controller.isAdd.value ? 12 : 16,
                        bgColor:
                            controller.isAdd.value ? Colors.red : Colors.white,
                        borderColor:
                            controller.isAdd.value ? Colors.red : Colors.teal,
                        textColor:
                            controller.isAdd.value ? Colors.white : Colors.teal,
                        onPressed: () => {controller.updatePageMode()},
                      ),
                    ),
                    const SizedBox(width: 10),
                    // ),
                    // Expanded(
                    //   flex: 1,
                    //   child: SizedBox(
                    //     height: 25,
                    //     child: CBTText(""),
                    //   ),
                    // ),
                    Expanded(child: _buildSearchInput()),
                    // Expanded(
                    //   flex: 1,
                    //   child: SizedBox(
                    //     height: 25,
                    //     child: CBTText(""),
                    //   ),
                    // ),
                  ],
                ),
              ),
              if (controller.count.value > 100)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    height: 30,
                    child: WebPagination(
                        currentPage: controller.currentPage.value,
                        totalPage: (controller.count.value / 100).toInt(),
                        onPageChanged: (page) {
                          controller.currentPage.value = page;
                          controller.setMenuModel(menuModel, page, "");
                        }),
                  ),
                ),
            ],
          ),
          body: Obx(
            () => Column(
              children: [
                Expanded(
                    child: controller.isAdd.value
                        ? Row(
                            children: [
                              Expanded(flex: 1, child: companyList(false)),
                              Expanded(
                                  flex: 6,
                                  child: controller.clickWebUrl.value.isNotEmpty?CbtWebView(
                                      url:controller.clickWebUrl.value):CbtWebView(
                                      url: CBTUrlByMenu.getUrlByMenu(
                                          menu: controller.m.value,
                                          formId: controller.isEditable.value &&
                                                  controller.isSelectedPosition
                                                          .value !=
                                                      10000
                                              ? controller.id.value
                                              : "",
                                          employeeId:
                                              controller.userId.value))),
                            ],
                          )
                        : controller.isListWeb.value
                            ? CbtWebView(
                                url: CBTUrlByMenu.getUrlByMenu(
                                    menu: controller.m.value,
                                    formId: controller.isEditable.value &&
                                            controller
                                                    .isSelectedPosition.value !=
                                                10000
                                        ? controller.id.value
                                        : "",
                                    employeeId: controller.userId.value))
                            : companyList(true)),
              ],
            ),
          ),
        ));
  }

  Future openFilterSheet() {
    return Get.bottomSheet(
      Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        elevation: 10,
        child: BottomSheet(
          onClosing: () {},
          builder: (context) => DefaultTabController(
            length: 2,
            child: Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    // Add your onPressed code here!
                    Get.back();
                  },
                  backgroundColor: Colors.teal,
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
                // appBar: context.width > 700
                //     ? null
                //     : Container(),
                body: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: CboDropDown(
                                      borderColor: Colors.grey,
                                      hintText: "Select Category",
                                      valueText: "",
                                      onClick: () {},
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: CboDropDown(
                                      borderColor: Colors.grey,
                                      hintText: "Select Class",
                                      valueText: "",
                                      onClick: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: CboDropDown(
                                      borderColor: Colors.grey,
                                      hintText: "Select Subject",
                                      valueText: "",
                                      onClick: () {},
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: CboDropDown(
                                      borderColor: Colors.grey,
                                      hintText: "Select Book",
                                      valueText: "",
                                      onClick: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: CboDropDown(
                                      borderColor: Colors.grey,
                                      hintText: "Select Chapter",
                                      valueText: "",
                                      onClick: () {},
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: CboDropDown(
                                      borderColor: Colors.grey,
                                      hintText: "Select Student",
                                      valueText: "",
                                      onClick: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Container())
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget companyList(bool isEdit) {
    _itemExpansionKeys.addAll(List.generate(
        controller.cbtCommonList.value!.length, (index) => GlobalKey()));
    return Obx(
      () => controller.cbtCommonList.isNotEmpty
          ? Column(
              children: [
                companyheader_header(isEdit, controller.cbtHeaderList.value,
                    isExpanded: controller.cbtCommonList.length > 0
                        ? controller.cbtCommonList[0]!.isExpandble
                            ? true
                            : false
                        : false),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: ListView.builder(
                      itemCount: controller.cbtCommonList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => {
                          // if (controller.isAdd.value)
                          //   {
                          //     controller.onUpdateListClick(index,
                          //         isView: controller.isView.value,
                          //         isDelete: controller.isDelete.value),
                          //   }

                          // controller.onReady()
                        },
                        child: Obx(
                          () => controller.cbtCommonList[index]!.isExpandble
                              ? CbtLFExItem(
                                  isEdit: isEdit,
                                  isAdd: controller.isAdd.value,
                                  post: controller.cbtCommonList[index]!,
                                  controller: controller,
                                  index: index,
                                  itemExpansionKeys: _itemExpansionKeys,
                                  isSelectedPosition:
                                      controller.isSelectedPosition.value,
                                )
                              : CbtLFItem(
                                  isEdit: isEdit,
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

  Widget _buildSearchInput() {
    return Container(
        height: 30,
        margin: const EdgeInsets.only(bottom: 2, top: 2, right: 2),
        // padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(2),
        //     color: Colors.white,
        //     border: Border.all(color: Colors.teal, width: 1)),

        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
        width: 200,
        child: TextField(
          controller: controller.searchController,
          textAlign: TextAlign.center,
          onChanged: (val) {
            controller.findSearchData(val);
          },
          maxLines: 1,
          // inputFormatters: CustomTextInputFormatter.getIntFormatter(
          //     maxValue: totalPage.toDouble()),
          style: const TextStyle(
              textBaseline: TextBaseline.alphabetic,
              color: Colors.teal,
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w600),
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: "Search...",
              hintStyle: TextStyle(
                  color: Colors.teal,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              )),
        ));
  }

  Container companyheader_header(bool isEdit, List<CbtHeaderModel?> list,
      {bool isExpanded = false}) {
    return Container(
      color: Colors.grey.shade100,
      height: 30,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: isEdit ? getWidget(list, isExpanded) : [],
        ),
      ),
    );
  }

  List<Widget> getWidget(List<CbtHeaderModel?> list, bool isExpanded) {
    List<Widget> data = List.empty(growable: true);
    list.forEach((element) {
      data.add(Expanded(
          flex: element!.flex,
          child: CBTTextNew(
            element.title,
            style: TStyle.f12_B.styleWith(
                color: Colors.black, fontFamily: AppFontsNeo.leagueBold),
          )));
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
}
