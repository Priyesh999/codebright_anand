import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();
  RxBool obsecureText = true.obs;

  final RxList<MenuModel?> _menuList = <MenuModel>[].obs;

  List<MenuModel?> get menuList => _menuList;

  set menuList(List<MenuModel?> menuList) => _menuList.value = menuList;

  final RxBool isLoading = true.obs;

  Future<void> navigateToView(BuildContext context) async {
    await loadMenu();
    // await CoreInitializers.initServices();
    Future.delayed(const Duration(seconds: 2), () async {
      var desId = prefHandler.getDesignationId;
      if (await prefHandler.isLogIn()) {
        if (GetPlatform.isWeb || GetPlatform.isWindows) {
          // if (/*desId*/ 1 == 1) {
          Get.toNamed(Routes.HOME_ADMIN);
          // } else {
          // Get.toNamed(Routes.HOME_MOBILE);
          // }
          // Get.toNamed(Routes.TEST);
        } else {
          Get.toNamed(Routes.HOME_MOBILE);
        }
      } else {
        if (GetPlatform.isWeb || GetPlatform.isWindows) {
          // Get.toNamed(Routes.HOME_ADMIN);
          // Get.toNamed(Routes.HOME_MOBILE);
          Get.toNamed(Routes.LOGIN);
          // Get.toNamed(Routes.TEST);
          // Get.toNamed(Routes.WEBSITE);
        } else {
          // Get.toNamed(Routes.TEST);
          Get.toNamed(Routes.LOGIN);
        }
      }
    });
  }

  Future<void> loadMenu() async {
    isLoading.value = true;
    var userId = await prefHandler.getUserId();
    var loginToken = await prefHandler.getLoginToken();
    HomeAdminProvider().getMenuList(
      requestData: {"PR_USER_ID": userId.toString(), "PR_TOKEN": loginToken!},
      onSuccess: (posts) async {
        if (posts.isSuccess) {
          menuList.addAll(posts.resObject!);
        }
        await prefHandler.setMenuData(posts.resObject!);
        isLoading.value = false;
        update();
      },
      onError: (error) {
        isLoading.value = false;
        update();
        // print("Error");
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }
}
