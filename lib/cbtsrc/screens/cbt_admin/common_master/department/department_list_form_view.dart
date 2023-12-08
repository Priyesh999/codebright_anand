import 'package:digigyan/cbtsrc/core/loc.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepartmentLFView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DepartmentLFController());
    return _DepartmentLFView();
  }
}

class _DepartmentLFView extends GetView<DepartmentLFController> {
  _DepartmentLFView();

  @override
  Widget build(BuildContext context) {
    // controller.loadDepartment();
    return Scaffold(
      appBar: CbtAppBar(
        title: "Class",
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       if (controller_view_all.dart.isSelectedPosition != 10000) {
      //         Get.back(result: "SELECTED");
      //       } else {
      //         Get.back();
      //       }
      //     },
      //     backgroundColor: controller_view_all.dart.isSelectedPosition != 10000
      //         ? materialPrimaryColor
      //         : Colors.red,
      //     child: controller_view_all.dart.isSelectedPosition != 10000
      //         ? const Icon(
      //             Icons.send,
      //             color: Colors.white,
      //           )
      //         : const Icon(
      //             Icons.cancel,
      //             color: Colors.white,
      //           )),
      body: Obx(
        () => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // Card(
              //   margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
              //   child: Container(
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           left: 40, top: 12.0, bottom: 12, right: 40),
              //       child: CBTText(
              //         "Please Select Class",
              //         fontWeight: FontWeight.w600,
              //         mSize: 18,
              //         color: materialPrimaryColor,
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                flex: 1,
                child: controller.departmentList.isNotEmpty
                    ? departmentList(true)
                    : EmoticonsView(
                        text: "${LocaleKeys.no.tr} "
                            "${LocaleKeys.sourceScreen_extensions.tr}",
                        button: TextButton(
                          child: Text(LocaleKeys.sourceScreen_reload.tr),
                          onPressed: () => controller.onReady(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget departmentList(bool isEdit) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Container(
                child: GetPlatform.isWeb
                    ? GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 8 / 2),
                  itemCount: controller.departmentList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => {
                      controller.onUpdateListClick(index, isView: true),

                      // controller.onReady()
                    },
                    child: Obx(
                          () => SizedBox(
                        child: DepartmentItem(
                          isEdit: isEdit,
                          post: controller.departmentList[index],
                          controller: controller,
                          index: index,
                          isSelectedPosition:
                          controller.isSelectedPosition.value,
                        ),
                      ),
                    ),
                  ),
                )
                    : ListView.builder(
                  itemCount: controller.departmentList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => {
                      controller.onUpdateListClick(index, isView: true),
                      // controller.onReady()
                    },
                    child: Obx(
                          () => DepartmentItem(
                        isEdit: isEdit,
                        post: controller.departmentList[index],
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
          ),
        ],
      ),
    );
  }
}
