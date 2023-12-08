import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/category_list/category_lf_form/company_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designaton_list_form_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/model_exam.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/repo_exam.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/result/analysis_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExamController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();

  final RxList<String?> bannerList = <String>[].obs;

  RxString categoryID = "".obs;
  RxString classID = "".obs;
  RxString typeTab = "UNATTEMPTED".obs;
  RxString categoryName = "".obs;
  RxString className = "".obs;
  final RxString sharedValue = "Analysis".obs;
  Rx<AnalysisReport>? analysReport = AnalysisReport().obs;

  final RxList<DigiGyanModel?> subjectList = <DigiGyanModel>[].obs;
  final RxList<DigiGyanModel> subjectListCopy = <DigiGyanModel>[].obs;
  final RxList<ExamQuestionList> examList = <ExamQuestionList>[].obs;

  late BuildContext _context;

  final RxBool isLoading = true.obs;

  @override
  void onReady() async {
    // Get.put(DepartmentLFController());
    // Get.put(CategoryController());
  }


  onUpdateValue(String value) {
    sharedValue.value = value;

    if ("Analysis" == value) {
    } else {
      if ("Unattempted" == value) {
        typeTab.value = "UNATTEMPTED";
      } else if ("Attempted" == value) {
        typeTab.value = "ATTEMPTED";
      } else if ("Recommended" == value) {
        typeTab.value = "RECOMMENDED";
      }
    }
    loadExamQuestion();
  }

  Future<void> loadExamQuestion() async {
    isLoading.value = true;
    var token = await prefHandler.getUserToken();
    var categoryId = await prefHandler.getCategoryId();
    ExamProvider().getExamQuestionList(
      data: {"PR_TOKEN": token, "PR_QUERY": "", "PR_TYPE": typeTab.value},
      // urlStr: "mobile-api/online-test-paper",
      urlStr: "mobile-api/test-paper-list",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          examList.value.clear();
          examList.value.clear();
          examList.value = posts.resObject!;
          examList.value = posts.resObject!;
        } else {
          examList.value = [];
          examList.value = [];
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        examList.value.clear();
        examList.value.clear();
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }

  Future<void> loadPaperByBookQuestion(int bookId) async {
    isLoading.value = true;
    var token = await prefHandler.getUserToken();
    var categoryId = await prefHandler.getCategoryId();
    ExamProvider().getExamQuestionList(
      data: {"PR_TOKEN": token, "PR_QUERY": "", "PR_BOOK_ID": bookId},
      urlStr: "mobile-api/online-test-paper",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          examList.value.clear();
          examList.value.clear();
          examList.value = posts.resObject!;
          examList.value = posts.resObject!;
        } else {
          examList.value = [];
          examList.value = [];
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        examList.value.clear();
        examList.value.clear();
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }

  Future<void> examResult() async {
    isLoading.value = true;
    var token = await prefHandler.getUserToken();
    var userID = await prefHandler.getUserId();
    var data = {
      "PR_TOKEN": token,
      // "PR_TEST_PAPER_ID": paperID.value,
    };

    ExamProvider().resultPartialExam(
      data: data,
      urlStr: "mobile-api/user-data-analysis-report",
      //
      // urlStr: "mobile-api/test-analysis-report",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          analysReport!.value = posts.resObject!;
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
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

    await examResult();
    await loadExamQuestion();
  }

  @override
  void onInit() {
    setUserDetails();
    super.onInit();
  }
}
