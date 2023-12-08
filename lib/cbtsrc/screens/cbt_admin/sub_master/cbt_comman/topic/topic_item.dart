import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/topic/topic_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:octo_image/octo_image.dart';

class TopicItem extends StatelessWidget {
  final DigiGyanModel post;
  final bool isEdit;
  final bool isTable;
  final bool isAdd;
  final int index;
  final bool isImage;
  final TopicController controller;
  final int isSelectedPosition;

  const TopicItem(
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
    return Card(
      elevation: 10,
      color: isSelectedPosition == index ? Colors.green : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: post.image.isNotEmpty
                  ? GetPlatform.isWeb
                      ? OctoImage(
                          image: NetworkImage(post.image),
                          progressIndicatorBuilder: (context, progress) {
                            double? value;
                            var expectedBytes = progress?.expectedTotalBytes;
                            if (progress != null && expectedBytes != null) {
                              value = progress.cumulativeBytesLoaded /
                                  expectedBytes;
                            }
                            return CircularProgressIndicator(value: value);
                          },
                          errorBuilder: (context, error, stacktrace) =>
                              const Icon(Icons.error),
                        )
                      : ClipRect(
                          child: Image.network(
                            post.image ?? "",
                            height: 110,
                          ),
                        )
                  : ClipRect(
                      child: Image.asset(
                        'assets/images/user.png',
                        height: 110,
                      ),
                    ),
            ),
            Expanded(
                flex: 3,
                // child: Padding(
                //   padding: EdgeInsets.all(8),
                //   child: CBTText(
                //     post.prCompanyName!,
                //     mSize: CbtTxtSize.coloumnTitleHead,
                //     color: post.isSelected ? Colors.white : Colors.black,
                //   ),
                // )),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                  child: Column(
                    children: getDataCard(post.cbtRowList, isEdit, index,
                        isSelectedPosition == index),
                  ),
                )),
          ],
        ),
      ),
    );
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
    return data;
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
                    color: isSelected ? Colors.white : Colors.black,
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
