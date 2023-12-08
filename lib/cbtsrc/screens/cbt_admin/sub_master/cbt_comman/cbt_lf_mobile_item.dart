import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appIcons.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CbtLFMobileItem extends StatelessWidget {
  final DigiGyanModel post;
  final bool isEdit;
  final bool isTable;
  final bool isAdd;
  final int index;
  final bool isImage;
  final CbtLFController controller;
  final int isSelectedPosition;

  const CbtLFMobileItem(
      {Key? key,
      required this.post,
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: isTable,
            child: Row(children: getRowData(post.cbtRowList, isEdit, index)),
          ),
          Visibility(
            visible: !isTable,
            child: Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                  child: Column(
                    children: getDataCard(post.cbtRowList, isEdit, index),
                  ),
                )),
          ),
        ]);
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
    if (isEdit) {
      data.add(Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: true,
            child: CboIconBtn(
              color: Colors.green,
              onPress: () {
                controller.onUpdateListClick(index, post.id,
                    isView: false, isDelete: false, isEditable: true);
              },
              child: const Icon(
                AppIcons.edit,
                color: Colors.green,
                size: 22,
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: CboIconBtn(
              color: Colors.blue,
              onPress: () {
                controller.onUpdateListClick(index, post.id,
                    isView: true, isDelete: false);
              },
              child: const Icon(
                Icons.remove_red_eye,
                color: Colors.blue,
                size: 22,
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: CboIconBtn(
              color: Colors.red,
              onPress: () async {
                controller.onUpdateListClick(index, post.id,
                    isView: false, isDelete: true);
              },
              child: const Icon(
                AppIcons.delete,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
        ],
      ));
    }
    return data;
  }

  List<Widget> getDataCard(List<CbtHeaderModel?> list, bool isEdit, int index) {
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
                    style: TStyle.f16_B.styleWith(color: CodebrightColor.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: true,
                      child: CboIconBtn(
                        color: Colors.green,
                        onPress: () {
                          controller.onUpdateListClick(index, post.id,
                              isView: false, isDelete: false, isEditable: true);
                        },
                        child: const Icon(
                          AppIcons.edit,
                          color: Colors.green,
                          size: 22,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: true,
                      child: CboIconBtn(
                        color: Colors.red,
                        onPress: () async {
                          controller.onUpdateListClick(index, post.id,
                              isView: false, isDelete: true);
                        },
                        child: const Icon(
                          AppIcons.delete,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                )
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
                      style:
                          TStyle.f16_B.styleWith(color: CodebrightColor.black),
                    )),
                Expanded(
                  flex: 4,
                  child: CBTTextNew(
                    "  :  ${element.value.toTitleCase}",
                    style: TStyle.f16_B.styleWith(color: CodebrightColor.black),
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
