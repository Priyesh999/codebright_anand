import 'package:digigyan/cbtsrc/cbt_helpers/style/app_color.dart';
import 'package:digigyan/cbtsrc/screens/splash/splash_controller.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.navigateToView(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        child: Center(
          child: getData(),
        ),
      ),
    );
  }

  Container getData() {
    if (GetPlatform.isWeb) {
      return Container(
        height: 400,
        width: 400,
        child: Image.asset(AppImages.digigyanLogo),
      );
    } else {
      return Container(
        height: 200,
        width: 200,
        child: Image.asset(AppImages.digigyanLogo),
      );
    }
  }
}
