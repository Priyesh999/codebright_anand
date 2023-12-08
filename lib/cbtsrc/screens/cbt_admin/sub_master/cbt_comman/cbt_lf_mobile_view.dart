import 'package:digigyan/cbtsrc/cbt_helpers/app_expansion_tile.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_mobile_ex_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_mobile_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/cbt_webview/cbt_webview.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/appIcons.dart';

class CbtLFMobileView extends GetView<CbtLFController> {
  MenuModel menuModel;
  bool isTable;
  String sharedValue = "  Company Information  ";

  CbtLFMobileView(this.menuModel, {Key? key, this.isTable = false});

  final List<GlobalKey<AppExpansionTileState>> _itemExpansionKeys = [];

  @override
  Widget build(BuildContext context) {
    controller.setMenuModel(menuModel, 1, "");
    controller.setUserID();
    controller.isNative.value = false;
    return Obx(() => Scaffold(
          appBar: CbtAppBar(
            title: menuModel.prMenuName!.toTitleCase,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (controller.isAdd.value) {
                if (controller.isView.value) {
                  controller.isView.value = false;
                  controller.isAdd.value = false;
                } else {
                  controller.updatePageMode();
                }
              } else {
                controller.updatePageMode();
              }
            },
            backgroundColor:
                controller.isDelete.value ? Colors.red : Colors.teal,
            child: Obx(() => controller.isBtnLoading.value
                ? const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : controller.isAdd.value
                    ? const Icon(
                        Icons.backspace_rounded,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
          ),
          body: Obx(
            () => Column(
              children: [
                Expanded(
                    child: controller.isAdd.value
                        ? _openForm(menuModel)
                        : companyList(true, isTable)),
              ],
            ),
          ),
        ));
  }

  Future openFilterSheet() {
    return Get.bottomSheet(
      BottomSheet(
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
              body: context.width > 700 ? Container() : Container()),
        ),
      ),
    );
  }

  Widget companyList(bool isEdit, bool isTable) {
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
                        : false,
                    isTable: isTable),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: ListView.builder(
                      itemCount: controller.cbtCommonList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => {},
                        child: Obx(
                          () => controller.cbtCommonList[index]!.isExpandble
                              ? CbtLFMobileExItem(
                                  isTable: isTable,
                                  isEdit: isEdit,
                                  isAdd: controller.isAdd.value,
                                  post: controller.cbtCommonList[index]!,
                                  controller: controller,
                                  index: index,
                                  itemExpansionKeys: _itemExpansionKeys,
                                  isSelectedPosition:
                                      controller.isSelectedPosition.value,
                                )
                              : CbtLFMobileItem(
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

  Widget companyheader_header(bool isEdit, List<CbtHeaderModel?> list,
      {bool isExpanded = false, bool isTable = false}) {
    return isTable
        ? Container(
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
          )
        : SizedBox();
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
      return CbtWebView(
          url: CBTUrlByMenu.getUrlByMenu(
              menu: controller.m.value,
              formId: controller.isEditable.value &&
                      controller.isSelectedPosition.value != 10000
                  ? controller.id.value
                  : "",
              employeeId: controller.userId.value));
    }
  }
}
