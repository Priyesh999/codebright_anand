import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common_master/department/department_list_form_view.dart';

class CategoryController extends GetxController {

  TextEditingController searchController = TextEditingController();
  final RxBool isLoading = true.obs;
  final RxBool isBtnLoading = false.obs;
  final RxBool isAdd = false.obs;
  final RxBool isView = true.obs;
  final RxBool isDelete = false.obs;
  final RxInt isSelectedPosition = 10000.obs;
  final RxInt currentPage = 1.obs;
  List<DigiGyanModel> _searchList = [];
  RxList<DigiGyanModel> companyList =<DigiGyanModel>[].obs;
  List<DigiGyanModel> companyListCopy = [];

  final Rx<DateTime?> fassiDate = RxNullable<DateTime?>().setNull();

  errorMessage(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Alert",
      message: message,
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        Get.toNamed(Routes.HOME_ADMIN);
      },
    );
  }

  showPermission(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Permission Error",
      message: message,
      confirmText: "Go To Setting",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        openAppSettings();
      },
    );
  }




  @override
  void onReady() async {
    await loadCompany();
    super.onReady();
  }

  Future<void> loadCompany({bool isGoBack = false}) async {
    isLoading.value = true;
    var token=await prefHandler.getUserToken();
    CbtLFProvider().getPostsListByUrl(
      data: {"PR_TOKEN":token},
      urlStr: "mobile-api/categories",
      codeType: SubMenuCode.categoryCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          companyList.clear();
          companyList.addAll(posts.resObject!.data);
          companyListCopy.addAll(posts.resObject!.data);
        } else {
          companyList.value = [];
        }

        if (isGoBack) {
          Get.back();
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        isLoading.value = false;
        update();
        print("Error");
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }

  Future<void> updatePageMode() async {
    isBtnLoading.value = false;
    if (isAdd.value) {
      isAdd.value = false;
    } else {
      isAdd.value = true;
    }
  }

  void onUpdateListClick(int index,
      {required bool isView, required bool isDelete}) async {
    isAdd.value = true;
    this.isView.value = isView;
    this.isDelete.value = isDelete;

    companyList.forEach((element) {
      element!.selected = false;
    });
    companyList[index]!.selected = true;
    isSelectedPosition.value = index;

    await prefHandler.setCategoryId(companyList[index]!.id);
    await prefHandler.setCategoryName(companyList[index]!.title);

    Get.to(DepartmentLFView())?.then((value) => {
      if (value == "SELECTED")
        {
          Get.back(),
        }
    });
  }

  void saveData() async {
    isBtnLoading.value = true;
    isLoading.value = true;
  }



}
