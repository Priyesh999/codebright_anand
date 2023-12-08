import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/core/utils/language.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/common_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepartmentLFController extends GetxController {

  final RxBool _isLoading = true.obs;
  final RxBool _isBtnLoading = false.obs;

  bool get isLoading => _isLoading.value;

  bool get isBtnLoading => _isBtnLoading.value;

  set isLoading(bool value) => _isLoading.value = value;

  set isBtnLoading(bool value) => _isBtnLoading.value = value;
  final RxBool _isAdd = false.obs;

  bool get isAdd => _isAdd.value;

  set isAdd(bool value) => _isAdd.value = value;

  final RxInt _currentPage = 1.obs;

  int get currentPage => _currentPage.value;

  set currentPage(int value) => _currentPage.value = value;

  final RxBool _isView = true.obs;

  bool get isView => _isView.value;

  set isView(bool value) => _isView.value = value;

  final RxList<CbtDepartmentModel?> _departmentList =
      <CbtDepartmentModel>[].obs;
  List<CbtDepartmentModel?> get departmentList => _departmentList;
  set departmentList(List<CbtDepartmentModel?> departmentList) =>
      _departmentList.value = departmentList;

  //
  List<Language> groupByLanguageList = [];
  List<CbtDepartmentModel> _searchList = [];
  List<CbtDepartmentModel> departmentListCopy = [];

  late TextEditingController searchController = TextEditingController();


  TextEditingController titleC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  final RxString _status = "".obs;

  String get status => _status.value;

  set status(String value) => _status.value = value;

  final RxInt _isSelectedPosition = 10000.obs;

  int get isSelectedPosition => _isSelectedPosition.value;

  set isSelectedPosition(int value) => _isSelectedPosition.value = value;

  // Map<Language, List<Source>> groupBy() {
  //   var map = <Language, List<Source>>{};
  //   for (var element in sourceList) {
  //     if (localStorageService.sourceLanguages.contains(element.lang!)) {
  //       (map[langCodeToName(element.lang!)] ??= []).add(element);
  //     }
  //     if (element.id == localStorageService.lastUsed) {
  //       (map[langCodeToName('lastused')] ??= []).add(element);
  //     }
  //   }
  //   groupByLanguageList = map.keys.toList()
  //     ..sort((l1, l2) => langSortCmp(l1, l2));
  //   return map;
  // }

  Future<void> updatePageMode() async {
    isBtnLoading = false;
    if (isAdd) {
      isAdd = false;
    } else {
      isAdd = true;
    }
  }

  @override
  void onReady() async {
    // localStorageService.box.listenKey(sourceLangKey, (value) {
    //   groupByMap.value = groupBy();
    // });
    // localStorageService.box.listenKey(lastUsedKey, (value) {
    //   groupByMap.value = groupBy();
    // });
    await loadDepartment();
    super.onReady();
  }

  @override
  void onInit() async {

    super.onInit();
  }

  Future<void> loadDepartment({bool isGoBack=false}) async {
    isLoading = true;
    CBTCommonProvider().getDataList(
      onSuccess: (posts) {
        if (posts.isSuccess) {
          departmentList.clear();
          departmentList.addAll(posts.resObject!);
          departmentListCopy.addAll(posts.resObject!);
        } else {
          departmentList = [];
        }

        if(isGoBack){
          Get.back();
        }
        isLoading = false;
        update();
      },
      onError: (error) {
        isLoading = false;
        update();
        print("Error");
      },
      beforeSend: () {},
    );
    isLoading = false;
  }

  void onUpdateListClick(int index, {required bool isView}) async{
    departmentList.forEach((element) {
      element!.isSelected = false;
    });
    departmentList[index]!.isSelected = true;
    isSelectedPosition=index;
    status=departmentList[index]!.prStatus==0?"In-Active":"Active";
    titleC.text=departmentList[index]!.prDeptName!;
    descriptionC.text=departmentList[index]!.prDeptDesc!;

    isAdd=true;
    this.isView=isView==true&&this.isView?true:false;


  }

  void saveData() async {
    isBtnLoading = true;
    isLoading = true;
    CBTCommonProvider().postDataList(
      departmentModel: CbtDepartmentModel(
          prDeptName: titleC.text,
          prDeptDesc: descriptionC.text,
          prStatus: status == "Active" ? 1 : 0),
      onSuccess: (posts) async {
        if (posts.isSuccess) {
          errorMessage(posts.errorCause);
          isAdd = false;
          isLoading = false;
        } else {
          errorMessage(posts.errorCause);
          isAdd = false;
          isLoading = false;
        }
        // isAdd=true;
        isBtnLoading = false;
        await loadDepartment(isGoBack: true);
        isLoading = false;
        update();
      },
      onError: (error) {
        isLoading = false;
        update();
        print("Error");
      },
      beforeSend: () {},
    );
    isLoading = false;
    // isBtnLoading = false;
  }


  void deleteData() async {
    isLoading = true;
    CBTCommonProvider().postDataList(
      departmentModel: CbtDepartmentModel(
          prDeptName: titleC.text,
          prDeptDesc: descriptionC.text,
          prStatus: status == "Active" ? 1 : 0),
      onSuccess: (posts) async {
        if (posts.isSuccess) {
          errorMessage(posts.errorCause);
          isLoading = false;
        } else {
          errorMessage(posts.errorCause);
          isLoading = false;
        }
        await loadDepartment(isGoBack: true);
        isLoading = false;
        update();
      },
      onError: (error) {
        isLoading = false;
        update();
        print("Error");
      },
      beforeSend: () {},
    );
    isLoading = false;
    // isBtnLoading = false;
  }


  void onUpdateStatus(selected) {
    status = selected;
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
      if (p!.prDeptName!.toLowerCase().contains(queryText)/* ||
          p.prDeptDesc!.toLowerCase().contains(queryText)*/) {
        _searchList.add(p);
      }
    });

    departmentList=_searchList.isNotEmpty?_searchList:departmentListCopy;


  }



}









//
//
//
//
// import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
// import 'package:digigyan/cbtsrc/cbt_helpers/utils_barrel.dart';
// import 'package:digigyan/cbtsrc/cbt_model/cbt_page_control_model.dart';
// import 'package:digigyan/cbtsrc/core/utils/language.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/common_repo.dart';
// import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_model.dart';
// import 'package:get/get.dart';
//
// class DepartmentLFController extends GetxController {
//   final Rx<UiDepartment> _uiDepartment = UiDepartment().obs;
//
//   UiDepartment get uiDepartment => _uiDepartment.value;
//
//   set uiDepartment(UiDepartment value) => _uiDepartment.value = value;
//
//   final RxBool _isLoading = true.obs;
//   final RxBool _isBtnLoading = false.obs;
//
//   bool get isLoading => _isLoading.value;
//
//   bool get isBtnLoading => _isBtnLoading.value;
//
//   set isLoading(bool value) => _isLoading.value = value;
//
//   set isBtnLoading(bool value) => _isBtnLoading.value = value;
//   final RxBool _isAdd = false.obs;
//
//   bool get isAdd => _isAdd.value;
//
//   set isAdd(bool value) => _isAdd.value = value;
//
//   final RxInt _currentPage = 1.obs;
//
//   int get currentPage => _currentPage.value;
//
//   set currentPage(int value) => _currentPage.value = value;
//
//   final RxBool _isView = true.obs;
//
//   bool get isView => _isView.value;
//
//   set isView(bool value) => _isView.value = value;
//
//   final RxList<CbtDepartmentModel> _departmentList =
//       <CbtDepartmentModel>[].obs;
//
//   List<CbtDepartmentModel> get departmentList => _departmentList;
//
//   set departmentList(List<CbtDepartmentModel> departmentList) =>
//       _departmentList.value = departmentList;
//
//   //
//   List<Language> groupByLanguageList = [];
//   final List<CbtDepartmentModel> _searchList = [];
//   List<CbtDepartmentModel> departmentListCopy = [];
//
//   late TextEditingController searchController = TextEditingController();
//
//   TextEditingController titleC = TextEditingController();
//   TextEditingController descriptionC = TextEditingController();
//   final RxString _status = "".obs;
//
//   String get status => _status.value;
//
//   set status(String value) => _status.value = value;
//
//   final RxInt _isSelectedPosition = 10000.obs;
//
//   int get isSelectedPosition => _isSelectedPosition.value;
//
//   set isSelectedPosition(int value) => _isSelectedPosition.value = value;
//
//   Future<void> updatePageMode() async {
//     isBtnLoading = false;
//     if (isAdd) {
//       isAdd = false;
//     } else {
//       isAdd = true;
//     }
//   }
//
//   @override
//   void onReady() async {
//     await loadDepartment();
//     super.onReady();
//   }
//
//
//   Future<void> loadDepartment({bool isGoBack = false}) async {
//     isLoading = true;
//     CBTCommonProvider().getDataList(
//       onSuccess: (posts) {
//         if (posts.isSuccess) {
//           departmentList.clear();
//           departmentList.addAll(posts.resObject!);
//           departmentListCopy.addAll(posts.resObject!);
//         } else {
//           departmentList = [];
//         }
//
//         uiDepartment.title = CbtPageModel(name: "demo",data: "Demo");
//         uiDepartment.description = CbtPageModel(name: "description",data: "Demo");
//         uiDepartment.departmentList = departmentList;
//
//         if (isGoBack) {
//           Get.back();
//         }
//         isLoading = false;
//         update();
//       },
//       onError: (error) {
//         isLoading = false;
//         update();
//         if (kDebugMode) {
//           print("Error");
//         }
//       },
//       beforeSend: () {},
//     );
//     isLoading = false;
//   }
//
//   void onUpdateListClick(int index, {required bool isView}) async {
//     for (var element in departmentList) {
//       element.isSelected = false;
//     }
//     departmentList[index].isSelected = true;
//     isSelectedPosition = index;
//     status = departmentList[index].prStatus == 0 ? "In-Active" : "Active";
//     titleC.text = departmentList[index].prDeptName!;
//     descriptionC.text = departmentList[index].prDeptDesc!;
//
//     uiDepartment.title.data = departmentList[index].prDeptName!;
//     uiDepartment.description.data=departmentList[index].prDeptDesc!;
//
//     isAdd = true;
//     this.isView = isView == true && this.isView ? true : false;
//   }
//
//   void saveData() async {
//     isBtnLoading = true;
//     isLoading = true;
//     CBTCommonProvider().postDataList(
//       departmentModel: CbtDepartmentModel(
//           prDeptName: titleC.text,
//           prDeptDesc: descriptionC.text,
//           prStatus: status == "Active" ? 1 : 0),
//       onSuccess: (posts) async {
//         if (posts.isSuccess) {
//           errorMessage(posts.errorCause);
//           isAdd = false;
//           isLoading = false;
//         } else {
//           errorMessage(posts.errorCause);
//           isAdd = false;
//           isLoading = false;
//         }
//         // isAdd=true;
//         isBtnLoading = false;
//         await loadDepartment(isGoBack: true);
//         isLoading = false;
//         update();
//       },
//       onError: (error) {
//         isLoading = false;
//         update();
//         if (kDebugMode) {
//           print("Error");
//         }
//       },
//       beforeSend: () {},
//     );
//     isLoading = false;
//     // isBtnLoading = false;
//   }
//
//   void deleteData() async {
//     isLoading = true;
//     CBTCommonProvider().postDataList(
//       departmentModel: CbtDepartmentModel(
//           prDeptName: titleC.text,
//           prDeptDesc: descriptionC.text,
//           prStatus: status == "Active" ? 1 : 0),
//       onSuccess: (posts) async {
//         if (posts.isSuccess) {
//           errorMessage(posts.errorCause);
//           isLoading = false;
//         } else {
//           errorMessage(posts.errorCause);
//           isLoading = false;
//         }
//         await loadDepartment(isGoBack: true);
//         isLoading = false;
//         update();
//       },
//       onError: (error) {
//         isLoading = false;
//         update();
//         if (kDebugMode) {
//           print("Error");
//         }
//       },
//       beforeSend: () {},
//     );
//     isLoading = false;
//     // isBtnLoading = false;
//   }
//
//   void onUpdateStatus(selected) {
//     status = selected;
//   }
//
//   errorMessage(String message) {
//     CustomAlertDialog.showPresenceAlert(
//       title: "Alert",
//       message: message,
//       cancelText: "",
//       confirmText: "",
//       onCancel: () => Get.back(),
//       onConfirm: () async {
//         Get.back();
//       },
//     );
//   }
//
//   void findSearchData(String queryText) {
//     queryText = queryText.toLowerCase();
//
//     _searchList.clear();
//     for (var p in departmentList) {
//       if (p.prDeptName!.toLowerCase().contains(
//           queryText) /* ||
//           p.prDeptDesc!.toLowerCase().contains(queryText)*/
//       ) {
//         _searchList.add(p);
//       }
//     }
//
//     departmentList = _searchList.isNotEmpty ? _searchList : departmentListCopy;
//   }
// }
//
