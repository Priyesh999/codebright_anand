import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designaton_list_form_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();

  final RxList<String?> bannerList = <String>[].obs;

  RxString categoryID = "".obs;
  RxString classID = "".obs;
  RxString categoryName = "".obs;
  RxString className = "".obs;

  final RxList<DigiGyanModel?> subjectList = <DigiGyanModel>[].obs;
  final RxList<DigiGyanModel> subjectListCopy = <DigiGyanModel>[].obs;

  late BuildContext _context;

  final RxBool isLoading = true.obs;

  @override
  void onReady() async {
    // Get.put(DepartmentLFController());
    // Get.put(CategoryController());
  }

  void openMenu(DigiGyanModel phMenu) async {
    Get.to(() => DesignationLFView(phMenu), binding: DesignationLFBinding());
  }

  Future<void> loadSubject({bool isGoBack = false}) async {
    isLoading.value = true;
    var classId = await prefHandler.getClassId();
    var categoryId = await prefHandler.getCategoryId();
    var token = await prefHandler.getUserToken();
    CbtLFProvider().getPostsListByUrl(
      data: {
        'PR_CLASS_ID': classId,
        // 'PR_CLASS_ID': 1,
        "PR_CATEGORY_ID": categoryId,
        "PR_TOKEN": token
      },
      urlStr: "mobile-api/books",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          subjectList.value.clear();
          subjectListCopy.value.clear();
          subjectList.value = posts.resObject!.data;
          subjectListCopy.value = posts.resObject!.data;
        } else {
          subjectList.value = [];
          subjectListCopy.value = [];
        }

        if (isGoBack) {
          Get.back();
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        subjectList.value.clear();
        subjectListCopy.value.clear();
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }

  Future<void> setUserDetails() async {
    categoryID.value = (await prefHandler.getCategoryId())!;
    categoryName.value = (await prefHandler.getCategoryName())!;
    className.value = (await prefHandler.getClassName())!;
    classID.value = (await prefHandler.getClassId())!;

    await loadSubject();
  }

  @override
  void onInit() {
    setUserDetails();
    super.onInit();
  }
}
