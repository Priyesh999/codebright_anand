import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/player_type_enum.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/youtubePlayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../cbt_webview/cbt_webview.dart';
import 'nugget_listing.dart';

class VideoController extends GetxController {
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
  RxString categoryID = "".obs;
  RxString classID = "".obs;
  RxString categoryName = "".obs;
  RxString className = "".obs;

  CbtPlayerType? cbtPlayer;

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
      required String urlStr,
      required DigiGyanModel cbtCommonModel,
      required CbtPlayerType cbtPlayer}) async {
    var token=await prefHandler.getUserToken();
    await CbtLFProvider().getPostsListByUrl(
      data: {
        'PR_TOKEN':token,
        'PR_TOPIC_ID': cbtCommonModel.id,
        "PR_CATEGORY_ID": (await prefHandler.getCategoryId())!
      },
      urlStr: urlStr,
      codeType: cbtPlayer == CbtPlayerType.CBT_VIDEO
          ? SubMenuCode.videoCode
          : SubMenuCode.simulationCode,
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

        loadCommonList(cbtCommonModel: cbtCommonModel, urlStr: urlStr,cbtPlayer: cbtPlayer);
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

    if (isSelectedPosition.value != 10000) {
      if (cbtPlayer == CbtPlayerType.CBT_SIMULATION) {
        Get.to(() => CbtWebView(
          title:
              cbtCommonList
              .value[isSelectedPosition.value]!
              .title,
          url: cbtCommonList.value[isSelectedPosition.value]!.image,
        ));
      } else {
        if (GetPlatform.isWeb) {
          // Get.to(() => YoutubeViewer());
        } else {
          Get.to(() => NuggetsScreen(
              currentIndex: isSelectedPosition.value));
        }
      }
    } else {
      Get.back();
    }

  }

  void saveData() async {
    isBtnLoading.value = true;
    isLoading.value = true;
  }

  void findSearchData(String queryText) {
    queryText = queryText.toLowerCase();

    _searchList.clear();
    cbtCommonList.forEach((p) {
      if (p!.title.toLowerCase().contains(
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

  void setMenuModel(DigiGyanModel cbtCommonModel, String url,
      CbtPlayerType cbtPlayer) async {
    isAdd.value = false;
    isEditable.value = false;
    isView.value = false;
    // m.value = cbtCommonModel;
    isSelectedPosition.value = 10000;
    isListWeb.value = false;
    await loadCommonList(
        cbtCommonModel: cbtCommonModel, urlStr: url, cbtPlayer: cbtPlayer);
  }

  void setUserDetails(CbtPlayerType cbtPlayer1) async {
    cbtPlayer=cbtPlayer1;
    categoryID.value = (await prefHandler.getCategoryId())!;
    categoryName.value = (await prefHandler.getCategoryName())!;
    className.value = (await prefHandler.getClassName())!;
    classID.value = (await prefHandler.getClassId())!;
  }
}
