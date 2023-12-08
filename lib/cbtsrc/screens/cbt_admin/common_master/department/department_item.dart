import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';

class DepartmentItem extends StatelessWidget {
  final DigiGyanModel post;
  final bool isEdit;
  final int index;
  final int isSelectedPosition;
  final DepartmentLFController controller;

  const DepartmentItem(
      {Key? key,
      required this.post,
      required this.isEdit,
      required this.index,
      required this.isSelectedPosition,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: isSelectedPosition == index ? Colors.green : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: "" == "j"
                  ? ClipRect(
                      child: Image.network(
                        "" ?? "",
                        height: 60,
                      ),
                    )
                  : ClipRect(
                      child: Image.asset(
                        'assets/images/user.png',
                        height: 60,
                      ),
                    ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CBTTextNew(
                    post.title,
                    style: TStyle.f16_B.styleWith(
                        color: post.selected ? Colors.white : Colors.black),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
