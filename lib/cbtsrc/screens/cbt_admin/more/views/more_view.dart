import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../cbt_data/cbt_db/cache/preference_handler.dart';
import '../../../../cbt_helpers/dailog/custom_alert_dialog.dart';
import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  Size? pgSize;

  @override
  Widget build(BuildContext context) {
    pgSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("Logout".tr),
            leading: const Icon(Icons.logout),
            onTap: () => {
            CustomAlertDialog.showPresenceAlert(
            title: "Logout!!",
            message: "Are you sure to logout?",
            onCancel: () => Get.back(),
            onConfirm: ()=> {
            prefHandler.logout(),
            // Get.to(SplashView());
            Get.toNamed(Routes.SPLASH),
            })
            },
          ),
        ],
      ),
    );
  }
}
