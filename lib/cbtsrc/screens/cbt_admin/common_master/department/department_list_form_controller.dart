import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_model/cbt_drop_down.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/common_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepartmentLFController extends GetxController {
  // Rx<UiDepartment> uiDepartment = new UiDepartment().obs;
  RxList<DigiGyanModel> departmentList = <DigiGyanModel>[].obs;
  RxBool isLoading = true.obs;
  RxBool isAdd = false.obs;
  RxBool isBtnLoading = false.obs;
  RxInt currentPage = 1.obs;
  RxBool isView = true.obs;
  List<DigiGyanModel> _searchList = [];
  List<DigiGyanModel> departmentListCopy = [];
  RxString title = "".obs;
  RxString description = "".obs;
  late TextEditingController searchController = TextEditingController();
  final Rx<CbtDropDown> status = CbtDropDown().obs;
  final RxInt isSelectedPosition = 10000.obs;

  Future<void> updatePageMode() async {
    isBtnLoading.value = false;
    if (isAdd.value) {
      isAdd.value = false;
    } else {
      isAdd.value = true;
    }
  }

  @override
  void onReady() async {
    await loadDepartment();
    super.onReady();
  }

  @override
  void onInit() async {

    super.onInit();
  }

  Future<void> loadDepartment({bool isGoBack = false}) async {
    isLoading.value = true;
    var categoryID = await prefHandler.getCategoryId();
    var token=await prefHandler.getUserToken();
    CbtLFProvider().getPostsListByUrl(
      data: {"PR_CATEGORY_ID": categoryID,"PR_TOKEN":token},
      urlStr: "mobile-api/classes",
      codeType: SubMenuCode.classCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          departmentList.clear();
          departmentList.addAll(posts.resObject!.data);
          departmentListCopy.addAll(posts.resObject!.data);
        } else {
          departmentList.value = [];
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
  }

  void onUpdateListClick(int index, {required bool isView}) async {
    departmentList.forEach((element) {
      element.selected = false;
    });
    departmentList[index].selected = true;
    isSelectedPosition.value = index;

    prefHandler.setClassId(departmentList[index].id);
    prefHandler.setClassName(departmentList[index].title);

    isAdd.value = true;
    this.isView.value = isView == true && this.isView.value ? true : false;

    if (isSelectedPosition != 10000) {
      Get.back(result: "SELECTED");
    } else {
      Get.back();
    }
  }

  void saveData() async {
    isBtnLoading.value = true;
    isLoading.value = true;
    CBTCommonProvider().postDataList(
      departmentModel: CbtDepartmentModel(
          prDeptName: title.value,
          prDeptDesc: description.value,
          prStatus: status == "Active" ? 1 : 0),
      onSuccess: (posts) async {
        if (posts.isSuccess) {
          errorMessage(posts.errorCause);
          isAdd.value = false;
          isLoading.value = false;
        } else {
          errorMessage(posts.errorCause);
          isAdd.value = false;
          isLoading.value = false;
        }
        // isAdd=true;
        isBtnLoading.value = false;
        await loadDepartment(isGoBack: true);
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
    // isBtnLoading = false;
  }


  void onUpdateStatus(selected) {
    status.value = selected;
  }

  errorMessage(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Alert",
      message: message,
      cancelText: "",
      confirmText: "",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
      },
    );
  }

  void findSearchData(String queryText) {
    queryText = queryText.toLowerCase();

    _searchList.clear();
    departmentList.forEach((p) {
      if (p.title.toLowerCase().contains(
              queryText) /* ||
          p.prDeptDesc!.toLowerCase().contains(queryText)*/
          ) {
        _searchList.add(p);
      }
    });

    departmentList.value =
        _searchList.isNotEmpty ? _searchList : departmentListCopy;
  }

  Future<void> onChangeTitle(String val) async {
    title.value = val;
  }

  Future<void> onChangeDescription(String val) async {
    description.value = val;
  }
}
