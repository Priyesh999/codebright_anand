import 'package:digigyan/cbtsrc/cbt_helpers/app_expansion_tile.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/topic/topic_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/topic/topic_item.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/cbt_webview/cbt_webview.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../utils/appIcons.dart';

class TopicMobileView extends GetView<TopicController> {
  MenuModel menuModel;
  bool isTable;
  String sharedValue = "  Company Information  ";

  TopicMobileView(this.menuModel, {Key? key, this.isTable = false});

  final List<GlobalKey<AppExpansionTileState>> _itemExpansionKeys = [];

  @override
  Widget build(BuildContext context) {
    controller.setMenuModel(menuModel);
    controller.setUserID();
    controller.isNative.value = false;
    return Obx(() => Scaffold(
          appBar: CbtAppBar(
            title: menuModel.prMenuName!.toTitleCase,
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (controller.isSelectedPosition != 10000) {
                  // Get.to(DepartmentLFView())?.then((value) => {
                  //   if(value=="SELECTED"){
                  //     Get.back(),
                  //   }
                  // });
                } else {
                  Get.back();
                }
              },
              backgroundColor: controller.isSelectedPosition != 10000
                  ? CodebrightColor.cbtPrimarColor
                  : Colors.red,
              child: controller.isSelectedPosition != 10000
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
                Expanded(child: companyList(true, isTable)),
              ],
            ),
          ),
        ));
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
                    child: ListView.builder(
                      itemCount: controller.cbtCommonList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => {
                          controller.onUpdateListClick(
                              index, controller.cbtCommonList[index]!.id,
                              isView: true, isDelete: false, isEditable: true),
                        },
                        child: Obx(
                          () => TopicItem(
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
              style: TStyle.f16_B.styleWith(color: CodebrightColor.black))));
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
