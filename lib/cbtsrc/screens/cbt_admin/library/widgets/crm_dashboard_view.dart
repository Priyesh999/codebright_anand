import 'package:digigyan/cbtsrc/screens/cbt_admin/library/controllers/crmdashboard_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_webview/cbt_webview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CrmDashboard extends GetView<CrmDashBoardController> {
  const CrmDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 controller.setUserData();
    return Obx(() => CbtWebView(url: "https://demo.codebright.in/form/${controller.userId.value}"));
  }
}
