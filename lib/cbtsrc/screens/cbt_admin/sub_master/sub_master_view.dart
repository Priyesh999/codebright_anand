import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/widgets/menu_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/sub_master_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cbt_helpers/cbt_loader.dart';

class SubMasterView extends GetView<SubMasterController> {
  MenuModel menuModel;

  SubMasterView(this.menuModel);

  @override
  Widget build(BuildContext context) {
    controller.setMenuList(menuModel);
    return Scaffold(
      // appBar: TabBar(
      //     controller_view_all.dart: controller_view_all.dart.tabController,
      //     padding: EdgeInsets.all(10),
      //     // isScrollable: context.width > 700 ? true : false,
      //     labelColor: Colors.white,
      //     unselectedLabelColor: context.textTheme.bodyText1!.color,
      //     labelStyle: TextStyle(fontSize: CbtTxtSize.coloumnTitleHead),
      //     unselectedLabelStyle:
      //         TextStyle(fontSize: CbtTxtSize.coloumnTitleHead),
      //     indicator: BoxDecoration(
      //       borderRadius: BorderRadius.circular(5),
      //       color: materialPrimaryColor,
      //     ),
      //     tabs: controller_view_all.dart.tabList),
      body: Obx(
        () => controller.isLoading.value
            ? CBTLoaderProgress()
            : Obx(
                () => Column(
                  children: [
                    Container(
                      height: 35,
                      color: Colors.grey.shade100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.menu.value!.prSubmenues!.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => {
                            controller.clickItem(index),
                          },
                          child: Obx(
                            () => MenuItem(
                              post: controller.menu.value!.prSubmenues![index],
                              controller: controller,
                              index: index,
                              isSelectedPosition:
                                  controller.isSelectedPosition.value,
                            ),
                          ),
                        ),
                      ),
                    ),
                    lineHeader(),

                    Expanded(
                      child: CbtLFView(controller.menu.value!
                          .prSubmenues![controller.isSelectedPosition.value]),
                    ),
                    // Expanded(
                    //   child: TabBarView(
                    //     controller: controller.tabController,
                    //     children: controller.viewList,
                    //   ),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }

  Row lineHeader() {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.grey,
          height: 1,
        )),
      ],
    );
  }
}
