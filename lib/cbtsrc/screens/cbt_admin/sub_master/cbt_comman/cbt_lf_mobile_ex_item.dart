import 'package:digigyan/cbtsrc/cbt_helpers/app_expansion_tile.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/empty_widget.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appIcons.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CbtLFMobileExItem extends StatelessWidget {
  final DigiGyanModel post;
  final bool isEdit;
  final bool isAdd;
  final int index;
  final bool isImage;
  final bool isTable;
  final CbtLFController controller;
  final int isSelectedPosition;
  final List<GlobalKey<AppExpansionTileState>> itemExpansionKeys;
  late int previousSelected = 0;
  late int selected = -1;

  CbtLFMobileExItem(
      {Key? key,
      required this.post,
      required this.isEdit,
      required this.index,
      required this.controller,
      required this.isSelectedPosition,
      required this.itemExpansionKeys,
      this.isImage = false,
      this.isTable = false,
      required this.isAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isTable
        ? AppExpansionTile(
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
                  Container(
                    color: Colors.grey.shade500,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildListOfItems(post.expendableList, isTable),
                    ),
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
            )
        : Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: AppExpansionTile(
                onExpansionChanged: (b) {
                  post.isExpanded = b;
                  if (previousSelected != index) {
                    itemExpansionKeys[previousSelected]
                        .currentState!
                        .collapse();
                  }
                  previousSelected = index;
                },
                key: itemExpansionKeys[index],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
                isDense: true,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: getDataCard(post.cbtRowList, isEdit, index),
                ),
                children: [
                  if (post.expendableList.isNotEmpty)
                    Container(
                      color: Colors.grey.shade300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            _buildListOfItems(post.expendableList, isTable),
                      ),
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

  List<Widget> _buildListOfItems(List<dynamic> txnItems, bool isTable) {
    List<Widget> _items = List.empty(growable: true);

    txnItems.forEach((v) {
      if (isTable) {
        _items.add(Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: getRowData(v.cbtRowList, isEdit, isMode: true),
        ));
      } else {
        _items.add(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: getDataCard(v.cbtRowList, isEdit, index),
        ));
      }
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
              style: TStyle.f16_B.styleWith(color: CodebrightColor.black),
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
                    style: TStyle.f16_B.styleWith(color: Colors.black),
                    color: Colors.black,
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
