import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designaton_list_form_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/model_exam.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/online_live_exam/live_exam_view.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/repo_exam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../exam_details_model.dart';
import '../quiz_screen.dart';

class ExamDetailsController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();

  RxString categoryID = "".obs;
  RxString classID = "".obs;
  RxString categoryName = "".obs;
  RxString className = "".obs;
  final RxString sharedValue = "Analysis".obs;
  late ExamQuestionList item;

  final RxList<DigiGyanModel?> subjectList = <DigiGyanModel>[].obs;
  final RxList<DigiGyanModel> subjectListCopy = <DigiGyanModel>[].obs;

  final Rx<ExamQuestionDetails> examQuestionDetails = ExamQuestionDetails().obs;

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

  onUpdateValue(String value) {
    sharedValue.value = value;
  }

  Future<void> loadExamQuestion(ExamQuestionList item) async {
    this.item = item;
    isLoading.value = true;
    var token = await prefHandler.getUserToken();
    var categoryId = await prefHandler.getCategoryId();
    ExamProvider().getExamQuestionListDet(
      data: {
        "PR_TOKEN": token,
        "PR_QUERY": "",
        "PR_TEST_PAPER_ID": item.prTestPaperId
      },
      urlStr: "mobile-api/online-test-paper",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          examQuestionDetails.value = posts.resObject!;
        } else {}
        isLoading.value = false;
        update();
      },
      onError: (error) {
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    // isLoading.value = false;
  }

  Future<void> setUserDetails() async {
    categoryID.value = (await prefHandler.getCategoryId())!;
    categoryName.value = (await prefHandler.getCategoryName())!;
    className.value = (await prefHandler.getClassName())!;
    classID.value = (await prefHandler.getClassId())!;

    // await loadSubject();
    // await loadExamQuestion();
  }

  @override
  void onInit() {
    setUserDetails();
    super.onInit();
  }

  Future<void> startExam() async {
    Get.to(LiveExamView(examQuestionDetails: examQuestionDetails.value));
  }
}
