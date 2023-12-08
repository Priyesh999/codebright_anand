import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/category_list/category_lf_form/company_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designaton_list_form_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/flash_card_list/flash_card_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';

class FlashController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();

  final RxList<String?> bannerList = <String>[].obs;

  RxString categoryID = "".obs;
  RxString classID = "".obs;
  RxString categoryName = "".obs;
  RxString className = "".obs;

  late final SwipableStackController cSwip;
  late final SwipableStackController cSwip1;
  RxInt leftPos = 0.obs;
  RxInt rightPos = 1.obs;

  final RxList<PrFlashCardDatum> subjectList = <PrFlashCardDatum>[].obs;
  final RxList<PrFlashCardDatum> subjectListCopy = <PrFlashCardDatum>[].obs;

  late BuildContext _context;

  final RxBool isLoading = true.obs;
  final RxInt flashCount = 1.obs;
  final RxBool isChanged = true.obs;

  @override
  void onReady() async {
    // Get.put(DepartmentLFController());
    // Get.put(CategoryController());
  }

  void openMenu(DigiGyanModel phMenu) async {
    Get.to(() => DesignationLFView(phMenu), binding: DesignationLFBinding());
  }

  // Future<void> loadSubject({bool isGoBack = false}) async {
  //   isLoading.value = true;
  //   var classId = await prefHandler.getClassId();
  //   var categoryId = await prefHandler.getCategoryId();
  //   CbtLFProvider().getPostsListByUrl(
  //     data: {'PR_CLASS_ID': classId, "PR_CATEGORY_ID": categoryId},
  //     urlStr: "book-list",
  //     codeType: SubMenuCode.bookCode,
  //     onSuccess: (posts) {
  //       if (posts.isSuccess) {
  //         subjectList.value.clear();
  //         subjectListCopy.value.clear();
  //         subjectList.value = posts.resObject!.data;
  //         subjectListCopy.value = posts.resObject!.data;
  //       } else {
  //         subjectList.value = [];
  //         subjectListCopy.value = [];
  //       }
  //
  //       if (isGoBack) {
  //         Get.back();
  //       }
  //       isLoading.value = false;
  //       update();
  //     },
  //     onError: (error) {
  //       subjectList.value.clear();
  //       subjectListCopy.value.clear();
  //       isLoading.value = false;
  //     },
  //     beforeSend: () {},
  //   );
  //   isLoading.value = false;
  // }

  Future<void> setUserDetails() async {
    categoryID.value = (await prefHandler.getCategoryId())!;
    categoryName.value = (await prefHandler.getCategoryName())!;
    className.value = (await prefHandler.getClassName())!;
    classID.value = (await prefHandler.getClassId())!;

    // await loadSubject();
  }

  void _listenController(){
    isChanged.value=!isChanged.value;
  }

  @override
  void onInit() {
    cSwip = SwipableStackController()..addListener(_listenController);
    cSwip1 = SwipableStackController()..addListener(_listenController);
    setUserDetails();
    super.onInit();
  }

  @override
  void onClose() {
    cSwip
      ..removeListener(_listenController)
      ..dispose();
    cSwip1
      ..removeListener(_listenController)
      ..dispose();
    super.onClose();
  }
}
