import 'package:digigyan/cbtsrc/screens/cbt_admin/category_list/category_lf_form/company_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'company_lf_item.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put(CategoryController());
    return _CategoryView();
  }
}

class _CategoryView extends GetView<CategoryController> {
  _CategoryView();

  @override
  Widget build(BuildContext context) {
    // controller.loadCompany();
    return Scaffold(
      appBar: CbtAppBar(
        title: "Category",
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // if (controller_view_all.dart.isSelectedPosition != 10000) {
            //   Get.to(DepartmentLFView())?.then((value) => {
            //         if (value == "SELECTED")
            //           {
            //             Get.back(),
            //           }
            //       });
            // } else {
            Get.back();
            // }
          },
          backgroundColor: /*controller_view_all.dart.isSelectedPosition != 10000
                  ? materialPrimaryColor
                  : */
              Colors.red,
          child: /*controller_view_all.dart.isSelectedPosition != 10000
                  ? const Icon(
                      Icons.send,
                      color: Colors.white,
                    )
                  :*/
              const Icon(
            Icons.cancel,
            color: Colors.white,
          )),
      body: Container(
        decoration: const BoxDecoration(
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
            //         "Please Select Category",
            //         fontWeight: FontWeight.w600,
            //         mSize: 18,
            //         color: materialPrimaryColor,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(flex: 1, child: Obx(() => companyList())),
          ],
        ),
      ),
    );
  }

  Widget companyList() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: GetPlatform.isAndroid || GetPlatform.isIOS
                ? ListView.builder(
                    itemCount: controller.companyList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => {
                        controller.onUpdateListClick(index,
                            isView: controller.isView.value,
                            isDelete: controller.isDelete.value),

                        // controller.onReady()
                      },
                      child: Obx(
                        () => CategoryItem(
                          post: controller.companyList[index]!,
                          controller: controller,
                          index: index,
                          isSelectedPosition:
                              controller.isSelectedPosition.value,
                        ),
                      ),
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 6 / 2),
                    itemCount: controller.companyList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => {
                        controller.onUpdateListClick(index,
                            isView: controller.isView.value,
                            isDelete: controller.isDelete.value),

                        // controller.onReady()
                      },
                      child: Obx(
                        () => SizedBox(
                          height: 200,
                          child: CategoryItem(
                            post: controller.companyList[index]!,
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
    );
  }
}
