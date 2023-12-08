import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BigScreenNavigationBar extends StatelessWidget {
  const BigScreenNavigationBar({
    Key? key,
    required this.controller,
    required this.navigationBarTitles,
  }) : super(key: key);

  final HomeAdminController controller;
  final List<String> navigationBarTitles;

  @override
  Widget build(BuildContext context) {
    return Obx(() => NavigationRail(
          useIndicator: true,
          elevation: 5,
          indicatorColor: CodebrightColor.cbtPrimarColor,
          backgroundColor: Colors.grey.shade200,
          extended: controller.expandedState,
          selectedIndex: controller.selectedIndex,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          selectedLabelTextStyle: const TextStyle(color: CodebrightColor.cbtPrimarColor),
          onDestinationSelected: (value) async => {
            // String des=await prefHandler.getDesignationId();

            if (await prefHandler.getDesignationId() == "1")
              {controller.selectedIndex = value}
            else if (await prefHandler.getDesignationId() == "2")
              {controller.selectedIndex = value}
            else if (await prefHandler.getDesignationId() == "3")
              {controller.selectedIndex = value}
            else if (await prefHandler.getDesignationId() == "4")
              {
                if (value == 0 || value == 3) {controller.selectedIndex = value}
              }else{
              // CboToast.showText(text: "You have not permission"),
                  }
          },
          labelType: controller.expandedState
              ? NavigationRailLabelType.none
              : NavigationRailLabelType.all,
          // leading: IconButton(
          //   onPressed: () =>
          //       controller_view_all.dart.expandedState = !controller_view_all.dart.expandedState,
          //   icon: Icon(
          //     controller_view_all.dart.expandedState
          //         ? Icons.arrow_back_ios
          //         : Icons.arrow_forward_ios,
          //     color: Get.theme.unselectedWidgetColor,
          //   ),
          // ),
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.collections_bookmark_outlined),
              selectedIcon: Icon(Icons.collections_bookmark_rounded),
              label: Text(navigationBarTitles[0].tr),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.new_releases_outlined),
              selectedIcon: Icon(Icons.new_releases_rounded),
              label: Text(navigationBarTitles[1].tr),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore_rounded),
              label: Text(navigationBarTitles[2].tr),
            ),
            // NavigationRailDestination(
            //   icon: Icon(Icons.download_outlined),
            //   selectedIcon: Icon(Icons.download_rounded),
            //   label: Text(navigationBarTitles[3].tr),
            // ),
            NavigationRailDestination(
              icon: Icon(Icons.more_horiz_outlined),
              selectedIcon: Icon(Icons.more_horiz_rounded),
              label: Text(navigationBarTitles[3].tr),
            ),
          ],
        ));
  }
}
