import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_webview/cbt_webview.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appIcons.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CbtLFItem extends StatelessWidget {
  final DigiGyanModel post;
  final bool isEdit;
  final bool isAdd;
  final int index;
  final bool isImage;
  final CbtLFController controller;
  final int isSelectedPosition;

  const CbtLFItem(
      {Key? key,
      required this.post,
      required this.isEdit,
      required this.index,
      required this.controller,
      required this.isSelectedPosition,
      this.isImage = false,
      required this.isAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 8, top: 8, right: 10, bottom: 8),
      decoration: BoxDecoration(
        color: post.selected && isAdd ? Colors.teal : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        children: [
          if (post.cbtRowList.length == 0) getColumnData(post, isEdit, index),
          if (post.cbtRowList.length > 0)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: getRowData(post.cbtRowList, isEdit, index),
            ),
        ],
      ),
    );
  }

  List<Widget> getRowData(List<CbtHeaderModel?> list, bool isEdit, int index) {
    List<Widget> data = List.empty(growable: true);

    if (isAdd) {
      for (int i = 0; i < 2; i++) {
        var element = list[i];
        String txtData =
            element!.title == "SrNo" ? (index + 1).toString() : element.value;

        if (element.title == "Image" && element.value.isNotEmpty) {
          data.add(Expanded(
              flex: element.flex,
              child: CachedNetworkImage(
                imageUrl: element.value,
                placeholder: (context, url) => Center(
                  child: Platform.isIOS
                      ? const CupertinoActivityIndicator()
                      : const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fitHeight,
              )));
        } else {
          data.add(Expanded(
              flex: element.flex,
              child: CBTTextNew(
                txtData,
                // mSize: CbtTxtSize.listTitleHead,
                style: TStyle.f10_B.styleWith(
                    color: Colors.black, fontFamily: AppFontsNeo.leagueBold),
              )));
        }
      }
    } else {
      for (var element in list) {
        String txtData =
            element!.title == "SrNo" ? (index + 1).toString() : element.value;

        if (element.title == "Image" && element.value.isNotEmpty) {
          data.add(Expanded(
              flex: element.flex,
              child: CachedNetworkImage(
                imageUrl: element.value,
                placeholder: (context, url) => Center(
                  child: Platform.isIOS
                      ? const CupertinoActivityIndicator()
                      : const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fitHeight,
              )));
        } else {
          data.add(Expanded(
              flex: element.flex,
              child: InkWell(
                onTap: () async{
                  if (element.isClick) {
                    if (element.click_type == "LIST") {
                      controller.clickList(
                          click_url: element.clickUrl,
                          reqKey: element.rwquestKey,
                          reqVal: element.requestValue.toString());
                    } else if (element.click_type == "CONVERT") {
                      controller.clickItemFromApi(
                          keyReq: element.rwquestKey,
                          idReq: element.requestValue.toString(),
                          url: element.clickUrl);
                    } else if (element.click_type == "WEB") {
                      controller.clickItemWebApi(
                          keyReq: element.rwquestKey,
                          idReq: element.requestValue.toString(),
                          url: element.clickUrl);

                      }
                  }
                },
                child: controller.isClickItem.value
                    ? SizedBox(
                        child: CircularProgressIndicator(),
                      )
                    : CBTTextNew(
                        txtData,
                        // mSize: CbtTxtSize.listTitleHead,
                        style: TStyle.f10_B.styleWith(
                            color: element.isClick
                                ? CodebrightColor.primary
                                : Colors.black,
                            fontFamily: AppFontsNeo.leagueBold),
                      ),
              )));
        }
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
    }

    return data;
  }

  Widget getColumnData(DigiGyanModel<dynamic> post, bool isEdit, int index) {
    return Container(
      child: Column(children: [
        CBTTextNew(
          post.title,
          style: TStyle.f12_B.styleWith(color: Colors.black),
        ),
        CBTTextNew(post.subTitle!,
            style: TStyle.f12_B.styleWith(color: Colors.black)),
        Image.network(
          post.image ?? "",
          height: 280,
          width: 1024,
        )
      ]),
    );
  }
}
