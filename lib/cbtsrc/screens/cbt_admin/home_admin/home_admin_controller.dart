import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:pub_semver/pub_semver.dart';

// const List<String> navigationBarPageNames = [
//   Routes.library,
//   Routes.updates,
//   Routes.browse,
//   Routes.downloads,
//   Routes.more,
// ];

class HomeAdminController extends GetxController {
  final PageController _pageController = PageController();
  final RxInt _selectedIndex = 0.obs;
  final RxBool _expandedState = false.obs;

  final RxBool isLoading = true.obs;
  // final RxString desin = "".obs;

  PageController get pageController => _pageController;

  int get selectedIndex => _selectedIndex.value;

  RxInt get selectedIndexObs => _selectedIndex;

  set selectedIndex(int value) => _selectedIndex.value = value;

  bool get expandedState => _expandedState.value;

  set expandedState(bool value) => _expandedState.value = value;

  @override
  void onInit() async {
    _selectedIndex.listen((index) {
      pageController.jumpToPage(index);
    });
    super.onInit();
  }

  @override
  void onReady() async {

    await loadMenu();
    var menuData = await prefHandler.getMenuData();
    if (menuData.isEmpty) {
      isLoading.value = true;
      await loadMenu();
    } else {
      isLoading.value = false;
    }

    // await loadDropDown();
    super.onReady();
  }

  Future<bool> isSync() async {
    if (await MethodUtils.isInternetPresent()) {
      try {
        // await SyncProvider().getPostsList(
        //   onSuccess: (posts) async {
        //     if (posts.isSuccess) {
        //       isLoading.value = false;
        //     }
        //   },
        //   onError: (error) {
        //     update();
        //   },
        //   beforeSend: () {},
        // );
      } catch (e, s) {
        String _msg = "Failed download menu_lf_model.dart...";
      }
    }
    return false;
  }

  Future<void> loadMenu() async {
    isLoading.value = true;
    var userId = await prefHandler.getUserId();
    var companyID = await prefHandler.getCompanyID();

    HomeAdminProvider().getMenuList(
      // requestData: {
      //   "USER_ID": userId.toString()
      // },
      requestData: {"PR_USER_ID":userId.toString()},
      onSuccess: (posts) async {
        if (posts.isSuccess) {
          await prefHandler.setMenuData(posts.resObject!);
        }

        isLoading.value = false;
        update();
      },
      onError: (error) {
        isLoading.value = false;
        update();
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }

  Future<void> loadDropDown() async {
    HomeAdminProvider().getDropDownList(
      requestData: {"PR_TYPE": "", "PR_PARENT_ID": ""},
      onSuccess: (posts) async {
        if (posts.isSuccess) {
          await prefHandler.setCbtDrop(posts.resObject!);
        }

        isLoading.value = false;
        update();
      },
      onError: (error) {
        isLoading.value = false;
        update();
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }

  void setDesignationId() async{
    // desin.value=(await prefHandler.getDesignationId())!;
  }
}
