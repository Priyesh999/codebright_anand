import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class TopicController extends GetxController {
  final Rx<MenuModel> m = MenuModel().obs;
  TextEditingController searchController = TextEditingController();
  final RxBool isLoading = true.obs;
  final RxBool isBtnLoading = false.obs;
  final RxBool isAdd = false.obs;
  final RxBool isView = true.obs;
  final RxBool isListWeb = false.obs;
  final RxBool isEditable = true.obs;
  final RxBool isNative = false.obs;
  final RxBool isDelete = false.obs;
  final RxInt isSelectedPosition = 10000.obs;
  final RxString sharedValue = "  Company Information  ".obs;
  final RxInt currentPage = 1.obs;
  final RxString id = "".obs;
  final RxString userId = "".obs;
  final RxList<DigiGyanModel?> cbtCommonList = <DigiGyanModel>[].obs;
  final RxList<CbtHeaderModel?> cbtHeaderList = <CbtHeaderModel>[].obs;
  List<DigiGyanModel> _searchList = [];
  List<DigiGyanModel> cbtCommonListCopy = [];
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

  navigateRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  navigatePinScreen() {
    Get.toNamed(Routes.PIN);
  }

  onUpdateValue(String value) {
    sharedValue.value = value;
  }

  @override
  void onReady() async {
    // super.onReady();
  }

  Future<void> loadCommonList(
      {bool isGoBack = false, required MenuModel menuModel}) async {
    // isLoading.value = true;

    if (menuModel.prListUrl!.contains(".p6d8f")) {
      isListWeb.value = true;
    } else {
      await CbtLFProvider().getPostsList(
        menuModel: menuModel,
        page: 1,query: "",
        onSuccess: (posts) {
          if (posts.isSuccess) {
            cbtCommonList.clear();
            cbtHeaderList.clear();
            cbtCommonList.addAll(posts.resObject!.data);
            cbtHeaderList.addAll(posts.resObject!.cbtHeaderModel);
            cbtCommonListCopy.addAll(posts.resObject!.data);
          } else {
            cbtCommonList.clear();
            cbtHeaderList.clear();
          }

          if (isGoBack) {
            Get.back();
          }
          isLoading.value = false;
          update();
        },
        onError: (error) {
          // isLoading.value = false;
          cbtCommonList.clear();
          cbtHeaderList.clear();
          update();
          print("Error");
        },
        beforeSend: () {},
      );
      isLoading.value = false;
    }
  }

  Future<void> updatePageMode() async {
    isBtnLoading.value = false;
    if (isAdd.value) {
      isSelectedPosition.value = 10000;
      isAdd.value = false;
    } else {
      isAdd.value = true;
    }
  }

  void onUpdateListClick(int index, String formId,
      {required bool isView,
      required bool isDelete,
      bool isEditable = false}) async {
    isAdd.value = true;
    this.isView.value = isView;
    this.isEditable.value = isEditable;
    this.isDelete.value = isDelete;
    cbtCommonList.forEach((element) {
      element!.selected = false;
    });
    cbtCommonList[index]!.selected = true;
    id.value = formId;
    isSelectedPosition.value = index;
  }

  void saveData() async {
    isBtnLoading.value = true;
    isLoading.value = true;
  }

  void findSearchData(String queryText) {
    queryText = queryText.toLowerCase();

    _searchList.clear();
    cbtCommonList.forEach((p) {
      if (p!.title!.toLowerCase().contains(
              queryText) /* ||
          p.prDeptDesc!.toLowerCase().contains(queryText)*/
          ) {
        _searchList.add(p);
      }
    });

    cbtCommonList.value =
        _searchList.isNotEmpty ? _searchList : cbtCommonListCopy;
  }

  Future<void> setUserID() async {
    var userID = await prefHandler.getUserId();
    userId.value = userID!;
  }

  void setMenuModel(MenuModel menuModel) async {
    isAdd.value = false;
    isEditable.value = false;
    isView.value = false;
    m.value = menuModel;
    isSelectedPosition.value = 10000;
    isListWeb.value = false;
    await loadCommonList(menuModel: m.value);
  }
}
