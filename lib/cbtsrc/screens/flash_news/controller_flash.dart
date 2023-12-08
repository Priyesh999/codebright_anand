import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/category_list/category_lf_form/company_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/flash_model.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/repo_flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashNewsController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();

  final RxList<String?> bannerList = <String>[].obs;

  RxString categoryID = "".obs;
  RxString classID = "".obs;
  RxString categoryName = "".obs;
  RxString className = "".obs;

  final RxList<FlashNewsModel?> flashNewsList = <FlashNewsModel>[].obs;

  late BuildContext _context;

  final RxBool isLoading = true.obs;
  final RxInt isSelectedPosition = (-1).obs;

  @override
  void onReady() async {
    // Get.put(DepartmentLFController());
    // Get.put(CategoryController());
  }

  void openMenu(FlashNewsModel phMenu) async {
    // Get.to(() => DesignationLFView(phMenu), binding: DesignationLFBinding());
  }

  Future<void> loadSubject({bool isGoBack = false}) async {
    isLoading.value = true;
    var token = await prefHandler.getUserToken();
    FlashNewsRepo().getFlashNews(
      data: {"PR_TOKEN":token},
      urlStr: "mobile-api/flash-news",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          flashNewsList.value.clear();
          flashNewsList.value.clear();
          flashNewsList.value = posts.resObject!;
          flashNewsList.value = posts.resObject!;
        } else {
          flashNewsList.value = [];
          flashNewsList.value = [];
        }

        if (isGoBack) {
          Get.back();
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        flashNewsList.value.clear();
        flashNewsList.value.clear();
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
