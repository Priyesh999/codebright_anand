import 'package:digigyan/cbtsrc/cbt_helpers/custom_widget/cbt_loader.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/widgets/menu_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/sub_master_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MasterView extends GetView<MasterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Obx(
            () => controller.isLoading.value
                ? CBTLoaderProgress()
                :Obx(
                    () => Column(
                    children: [
                     Container(
                        color: Colors.grey.shade100,
                        height: 35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.menuList.value.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => {
                              controller.clickItem(index),
                            },
                            child: Obx(() => MenuItemM(
                                  post: controller.menuList.value[index]!,
                                  controller: controller,
                                  index: index,
                                  isSelectedPosition:
                                      controller.isSelectedPosition.value,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SubMasterView(controller.menuList
                            .value[controller.isSelectedPosition.value]!),
                      ),
                    ],
                  )),
          ),
        );
  }

  Padding lineHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
              child: Container(
            color: Colors.grey,
            height: 2,
          )),
        ],
      ),
    );
  }
}
