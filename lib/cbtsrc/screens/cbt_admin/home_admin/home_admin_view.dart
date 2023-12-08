import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/core/loc.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/widgets/big_screen_navigation_bar.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/library/widgets/crm_dashboard_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/more/views/more_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/home_view.dart';
import 'package:digigyan/cbtsrc/screens/splash/splash_view.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cbt_data/cbt_db/cache/preference_handler.dart';
import '../../../cbt_helpers/dailog/custom_alert_dialog.dart';

const List<String> navigationBarTitles = [
  // LocaleKeys.screenTitle_browse,
  LocaleKeys.screenTitle_services,
  // LocaleKeys.screenTitle_dashboard,
  // LocaleKeys.screenTitle_more,
];

class HomeAdminView extends GetView<HomeAdminController> {
  @override
  Widget build(BuildContext context) {
    controller.setDesignationId();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(AppImages.cbtLogoSingle),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        title: Obx(
          () => Row(
            children: [
              Expanded(
                child: CBTText(
                  navigationBarTitles[controller.selectedIndex].tr,
                  color: CodebrightColor.cbtPrimarColor,
                ),
              ),
              TextButton(
                  child: Card(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CBTTextNew(
                        "Logout",
                        style: TStyle.f10_B.styleWith(color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: () async => {
                        CustomAlertDialog.showPresenceAlert(
                          title: "Logout!!",
                          message: "Are you sure to logout?",
                          onCancel: () => Get.back(),
                          onConfirm: () async {
                            prefHandler.logout();
                            Get.to(SplashView());
                            // Get.toNamed(Routes.HOME_ADMIN);
                          },
                        )
                      })
            ],
          ),
        ),
        // actions: [
        //   Obx(() => controller.selectedIndex == 0
        //       ? MasterAppBarActions()
        //       : Container()),
        //   Obx(() => controller.selectedIndex == 1
        //       ? MasterAppBarActions()
        //       : Container())
        // ],
      ),
      // bottomNavigationBar: context.width > 700.0
      //     ? Row(
      //         children: [
      //           Expanded(
      //             child: Container(
      //                 alignment: Alignment.centerLeft,
      //                 height: 15,
      //                 color: materialPrimaryColor,
      //                 child: CBTText(
      //                   "© Develope by CodeBright Technoliges Pvt. Ltd.     ",
      //                   mSize: 8,
      //                   mBold: true,
      //                   maxLine: 1,
      //                   color: Colors.white,
      //                 )),
      //           ),
      //           Container(
      //               alignment: Alignment.centerRight,
      //               height: 15,
      //               color: materialPrimaryColor,
      //               child: CBTText(
      //                 "© Copyright 2023 STUDENTADVISOR PUBLICATIONS PRIVATE LIMITED.     ",
      //                 mSize: 8,
      //                 mBold: true,
      //                 maxLine: 1,
      //                 color: Colors.white,
      //               )),
      //         ],
      //       )
      //     : SmallScreenNavigationBar(
      //         controller: controller,
      //         navigationBarTitles: navigationBarTitles,
      //       ),
      body: Column(
        children: [
          // lineHeader(),
          Expanded(
            child: Row(
              children: [
                // context.width > 700.0
                //     ? context.height < 500
                //         ? SingleChildScrollView(
                //             controller: ScrollController(),
                //             child: ConstrainedBox(
                //               constraints: BoxConstraints(maxHeight: 500),
                //               child: BigScreenNavigationBar(
                //                 controller: controller,
                //                 navigationBarTitles: navigationBarTitles,
                //               ),
                //             ),
                //           )
                //         : BigScreenNavigationBar(
                //             controller: controller,
                //             navigationBarTitles: navigationBarTitles,
                //           )
                //     : Container(),
                Expanded(
                  child: PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // HomeView(),
                        MasterView(),
                        // CrmDashboard(),
                        // MoreView(),
                      ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
