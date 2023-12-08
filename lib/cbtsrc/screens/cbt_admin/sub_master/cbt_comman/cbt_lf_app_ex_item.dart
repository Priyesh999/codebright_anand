import 'package:digigyan/cbtsrc/cbt_helpers/app_expansion_tile.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/empty_widget.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appIcons.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CbtLFExItem extends StatelessWidget {
  final DigiGyanModel post;
  final bool isEdit;
  final bool isAdd;
  final int index;
  final bool isImage;
  final CbtLFController controller;
  final int isSelectedPosition;
  final List<GlobalKey<AppExpansionTileState>> itemExpansionKeys;
  late int previousSelected = 0;
  late int selected = -1;

  CbtLFExItem(
      {Key? key,
      required this.post,
      required this.isEdit,
      required this.index,
      required this.controller,
      required this.isSelectedPosition,
      required this.itemExpansionKeys,
      this.isImage = false,
      required this.isAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 10, bottom: 8),
      decoration: BoxDecoration(
        color: post.selected && isAdd ? Colors.teal : Colors.white,
        // borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: AppExpansionTile(
          onExpansionChanged: (b) {
            post.isExpanded = b;
            if (previousSelected != index) {
              itemExpansionKeys[previousSelected].currentState!.collapse();
            }
            previousSelected = index;
          },
          key: itemExpansionKeys[index],
          backgroundColor: Colors.white,
          initiallyExpanded: false,
          isDense: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: getRowData(post.cbtRowList, isEdit, index: index),
          ),
          children: [
            if (post.expendableList.isNotEmpty)
              Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    _buildListOfItems(post.expendableList, post.id.toString()),
              )
            else
              Column(
                children: [
                  CBTText("Items not found."),
                  _stkEditDeleteBar(context, index, post),
                ],
              ),
          ]
          // this.drcallModel.map((e) => Text("${e.giftItemName}")).toList(),
          ),
    );
    ;
  }

  Widget _stkEditDeleteBar(
    BuildContext context,
    int rootIndex,
    DigiGyanModel data,
  ) {
    return Row(
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
                  isView: true, isDelete: false, isEditable: true);
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
    );
  }

  //widget for each call.

  Widget buildEmptySummary(BuildContext context, {String callName = ""}) {
    return EmptyWidget(
      msg: "Yet to make First $callName Call",
      // retry: () => {},
    );
    // CboTextRed("- Yet to make First Dr. Call"),);
  }

  List<Widget> _buildListOfItems(List<dynamic> txnItems, String id) {
    List<Widget> _items = List.empty(growable: true);

    txnItems.forEach((v) {
      _items.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: getRowDataChild(v.cbtRowList, isEdit, isMode: true, id: v.id),
      ));
    });

    return _items;
  }

  List<Widget> getRowData(List<CbtHeaderModel?> list, bool isEdit,
      {bool isMode = false, int index = 0}) {
    List<Widget> data = List.empty(growable: true);

    for (var element in list) {
      String txtData =
          element!.title == "SrNo" ? (index + 1).toString() : element.value;
      data.add(Expanded(
          flex: element.flex,
          child: CBTTextNew(txtData,
              style: TStyle.f16_B.styleWith(color: Colors.black),
              textAlign: TextAlign.start)));
    }
    if (isEdit) {
      data.add(Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: isMode,
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
            visible: isMode,
            child: CboIconBtn(
              color: Colors.blue,
              onPress: () {
                controller.onUpdateListClick(index, post.id,
                    isView: true, isDelete: false, isEditable: true);
              },
              child: const Icon(
                Icons.remove_red_eye,
                color: Colors.blue,
                size: 22,
              ),
            ),
          ),
          Visibility(
            visible: isMode,
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

  List<Widget> getRowDataChild(List<CbtHeaderModel?> list, bool isEdit,
      {bool isMode = false, int index = 0, String id = "0"}) {
    List<Widget> data = List.empty(growable: true);

    for (var element in list) {
      String txtData =
          element!.title == "SrNo" ? (index + 1).toString() : element.value;
      data.add(Expanded(
          flex: element.flex,
          child: CBTTextNew(txtData,
              style: TStyle.f16_B.styleWith(
                color: Colors.black,
              ),
              textAlign: TextAlign.start)));
    }
    if (isEdit) {
      data.add(Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: isMode,
            child: CboIconBtn(
              color: Colors.green,
              onPress: () {
                controller.onUpdateListClick(index, id,
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
            visible: isMode,
            child: CboIconBtn(
              color: Colors.blue,
              onPress: () {
                controller.onUpdateListClick(index, id,
                    isView: true, isDelete: false, isEditable: true);
              },
              child: const Icon(
                Icons.remove_red_eye,
                color: Colors.blue,
                size: 22,
              ),
            ),
          ),
          Visibility(
            visible: isMode,
            child: CboIconBtn(
              color: Colors.red,
              onPress: () async {
                controller.onUpdateListClick(index, id,
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
}
