import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_model/cbt_drop_down.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/utils/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/appIcons.dart';
import '../../../widgets/cbt_toast/toast.dart';

class CbtLFController extends GetxController {
  final Rx<MenuModel> m = MenuModel().obs;

  TextEditingController searchController = TextEditingController();
  final RxBool isLoading = true.obs;
  final RxBool isBtnLoading = false.obs;
  final RxBool isAdd = false.obs;
  final RxBool isView = true.obs;
  final RxBool isListWeb = false.obs;
  final RxBool isEditable = true.obs;
  final RxBool isClickItem = false.obs;
  final RxBool isNative = false.obs;
  final RxBool isDelete = false.obs;
  final RxInt isSelectedPosition = 10000.obs;
  final RxString sharedValue = "  Company Information  ".obs;
  final RxInt currentPage = 1.obs;
  final RxInt count = 0.obs;
  final RxString id = "".obs;
  final RxString userId = "".obs;
  final RxList<DigiGyanModel?> cbtCommonList = <DigiGyanModel>[].obs;
  final RxList<CbtHeaderModel?> cbtHeaderList = <CbtHeaderModel>[].obs;
  final Rx<CbtDropDown?> packageType = CbtDropDown().obs;
  final Rx<CbtDropDown?> legderAccount = CbtDropDown().obs;
  final Rx<CbtDropDown?> cnfGroup = CbtDropDown().obs;
  final Rx<CbtDropDown?> status = CbtDropDown().obs;
  final Rx<CbtDropDown?> state = CbtDropDown().obs;
  final Rx<CbtDropDown?> category = CbtDropDown().obs;
  List<DigiGyanModel> _searchList = [];
  List<DigiGyanModel> cbtCommonListCopy = [];
  final Rx<DateTime?> fassiDate = RxNullable<DateTime?>().setNull();

  RxString clickWebUrl = "".obs;

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
      {bool isGoBack = false,
      required MenuModel menuModel,
      int page = 1,
      String q = ""}) async {
    // isLoading.value = true;
    isAdd.value = false;
    isListWeb.value = false;
    // if (menuModel.prMenuCode=="CBT_IMPORT"||menuModel.prMenuCode=="CBT_PAPER_GENERATOR") {
    //   isListWeb.value = true;
    // } else {
    await CbtLFProvider().getPostsList(
      menuModel: menuModel,
      page: page,
      query: q,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          count.value = posts.count;
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
    // }
  }

  Future<void> clickList(
      {bool isGoBack = false,
      required String click_url,
      required String reqKey,
      required String reqVal,
      int page = 1,
      String q = ""}) async {
    // isLoading.value = true;
    isAdd.value = false;
    isListWeb.value = false;
    // if (menuModel.prMenuCode=="CBT_IMPORT"||menuModel.prMenuCode=="CBT_PAPER_GENERATOR") {
    //   isListWeb.value = true;
    // } else {
    await CbtLFProvider().getPostsClickList(
      click_url: click_url,
      requestkey: reqKey,
      requestValue: reqVal,
      page: page,
      query: q,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          count.value = posts.count;
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
    // }
  }

  Future<void> updatePageMode() async {
    isBtnLoading.value = false;
    clickWebUrl.value = "";
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
    setMenuModel(m.value, 1, queryText);
  }

  Future<void> setUserID() async {
    var userID = await prefHandler.getUserToken();
    userId.value = userID!;
  }

  void setMenuModel(MenuModel menuModel, int page, String query) async {
    isAdd.value = false;
    isEditable.value = false;
    isView.value = false;
    m.value = menuModel;
    isSelectedPosition.value = 10000;
    isListWeb.value = false;
    await loadCommonList(menuModel: m.value, page: page, q: query);
  }

  Future<void> clickItemFromApi(
      {required String keyReq,
      required String idReq,
      required String url}) async {
    // isClickItem.value = true;

    CustomAlertDialog.showPresenceAlert(
      title: "Alert",
      message: "Please wait data converting.....",
      cancelText: "",
      confirmText: "",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
      },
    );

    await CbtLFProvider().getClickItemPost(
      key: keyReq,
      id: idReq,
      urlData: url,
      onSuccess: (posts) {
        Get.back();
        CustomAlertDialog.showPresenceAlert(
          title: "Alert",
          message: posts.errorCause,
          cancelText: "",
          confirmText: "",
          onCancel: () => Get.back(),
          onConfirm: () async {
            Get.back();
          },
        );

        isClickItem.value = false;
      },
      onError: (error) {
        Get.back();
        isClickItem.value = false;
        CustomAlertDialog.showPresenceAlert(
          title: "Alert",
          message: error.toString(),
          cancelText: "",
          confirmText: "",
          onCancel: () => Get.back(),
          onConfirm: () async {
            Get.back();
          },
        );
      },
      beforeSend: () {},
    );
  }

  Future<void> clickItemWebApi(
      {required String keyReq,
      required String idReq,
      required String url}) async {
    var token = await prefHandler.getUserToken();
    clickWebUrl.value = ApiUrls.cbtBaseUrl(url)  + token.toString() + "/" + idReq;
    isAdd.value = true;
  }
}
