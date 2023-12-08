import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/sub_master_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';

class MenuItemM extends StatelessWidget {
  final MenuModel post;
  final int index;
  final bool isImage;
  final MasterController controller;
  final int isSelectedPosition;

  const MenuItemM(
      {Key? key,
      required this.post,
      required this.index,
      required this.controller,
      required this.isSelectedPosition,
      this.isImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // margin: EdgeInsets.only(bottom: 10),
    //   padding: const EdgeInsets.only(left: 8, top: 8, right: 10, bottom: 8),
    //   decoration: BoxDecoration(
    //     color: post.isSelected! ? Colors.teal : Colors.white,
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withAlpha(15),
    //         blurRadius: 1,
    //         spreadRadius: 1,
    //         offset: const Offset(0, 1),
    //       )
    //     ],
    //   ),
    //   child: CBTText(post.prMenuName!,
    //       mSize: 16,
    //       mBold: true,
    //       color: Colors.black,
    //       textAlign: TextAlign.start),
    // );
    return Card(
      elevation: 3,
      shadowColor: Colors.red,
      color: post.isSelected! ? Colors.red : Colors.red.shade50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
        child: Center(
          child: CBTTextNew(post.prMenuName!.toTitleCase,
              style: post.isSelected!
                  ? TStyle.f12_B.styleWith(color: Colors.white)
                  : TStyle.f12_M.style,
              textAlign: TextAlign.start),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final MenuModel post;
  final int index;
  final bool isImage;
  final SubMasterController controller;
  final int isSelectedPosition;

  const MenuItem(
      {Key? key,
      required this.post,
      required this.index,
      required this.controller,
      required this.isSelectedPosition,
      this.isImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.blue,
      color: post.isSelected! ? Colors.blue.shade900 : Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
        child: Center(
          child: CBTTextNew(post.prMenuName!.toTitleCase,
              // mSize: 14,
              // mBold: true,
              style: post.isSelected!
                  ? TStyle.f12_B.styleWith(color: Colors.white)
                  : TStyle.f12_M.style,
              textAlign: TextAlign.start),
        ),
      ),
    );
  }
}
