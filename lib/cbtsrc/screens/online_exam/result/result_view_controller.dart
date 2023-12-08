import 'package:digigyan/cbtsrc/screens/online_exam/exam_details_model.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/result/analysis_model.dart';
import 'package:get/get.dart';

import '../../../cbt_data/cbt_db/cache/preference_handler.dart';
import '../../../constants/ui_controls.dart';
import '../repo_exam.dart';

class ResultController extends GetxController {
  RxInt paperID = 0.obs;
  RxBool isLoading = false.obs;
  Rx<AnalysisReport>? analysReport = AnalysisReport().obs;

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
      // "mobile-api/user-data-analysis-report"

      urlStr: "mobile-api/test-analysis-report",
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

  void setPaperId(int paperId)async {
    paperID.value = paperId;
    await examResult();
  }
}
