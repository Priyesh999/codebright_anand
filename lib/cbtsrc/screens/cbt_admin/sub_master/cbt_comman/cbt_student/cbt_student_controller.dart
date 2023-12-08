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

import '../../cbt_video/player_type_enum.dart';
import '../../cbt_video/video_view.dart';

class StudentController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool isBtnLoading = false.obs;
  final RxBool isAdd = false.obs;
  final RxBool isView = true.obs;
  final RxBool isListWeb = false.obs;
  final RxBool isEditable = true.obs;
  final RxBool isNative = false.obs;
  final RxBool isDelete = false.obs;
  final RxInt isSelectedPosition = 0.obs;
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

  CbtPlayerType? typeView;

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

  onUpdateValue(String value) {
    sharedValue.value = value;
  }

  @override
  void onReady() async {
    // super.onReady();
  }

  Future<void> loadCommonList(
      {bool isGoBack = false, required DigiGyanModel cbtCommonModel}) async {
    var token = await prefHandler.getUserToken();
    await CbtLFProvider().getPostsListByUrl(
      data: {'PR_BOOK_ID': cbtCommonModel.id, "PR_TOKEN": token},
      urlStr: "mobile-api/topics",
      codeType: SubMenuCode.topicCode,
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

        // loadCommonList(cbtCommonModel: cbtCommonModel);
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
      bool isEditable = false,
      String image = ""}) async {
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

    if (cbtCommonList.value[isSelectedPosition.value]!.image.isEmpty) {
      cbtCommonList.value[isSelectedPosition.value]?..image = image;
    }
    if (isSelectedPosition != 10000) {
      if (typeView == CbtPlayerType.CBT_VIDEO) {
        Get.off(VideoView(cbtCommonList.value[isSelectedPosition.value]!,
            "video-list", CbtPlayerType.CBT_VIDEO));
      } else if (typeView == CbtPlayerType.CBT_SIMULATION) {
        Get.off(VideoView(cbtCommonList.value[isSelectedPosition.value]!,
            "simulation-list", CbtPlayerType.CBT_SIMULATION));
      } else if (typeView == CbtPlayerType.CBT_PDF) {
        Get.off(VideoView(cbtCommonList.value[isSelectedPosition.value]!,
            "simulation-list", CbtPlayerType.CBT_SIMULATION));
      }
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

  void setMenuModel(DigiGyanModel cbtCommonModel) async {
    isAdd.value = false;
    isEditable.value = false;
    isView.value = false;
    isSelectedPosition.value = 10000;
    isListWeb.value = false;
    // await loadCommonList(cbtCommonModel: cbtCommonModel);
  }

  void setUserDetails(CbtPlayerType typeView1) async {
    typeView = typeView1;
    categoryID.value = (await prefHandler.getCategoryId())!;
    categoryName.value = (await prefHandler.getCategoryName())!;
    className.value = (await prefHandler.getClassName())!;
    classID.value = (await prefHandler.getClassId())!;
  }
}
