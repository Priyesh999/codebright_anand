import 'package:digigyan/cbtsrc/screens/online_exam/exam_details_model.dart';
import 'package:get/get.dart';

import '../../../cbt_data/cbt_db/cache/preference_handler.dart';
import '../../../constants/ui_controls.dart';
import '../repo_exam.dart';
import '../result/result_view.dart';

class LiveExamController extends GetxController {
  RxInt isSelectedPosition = 0.obs;
  RxInt attempt = 0.obs;
  RxInt paperID = 0.obs;
  RxInt unattempt = 0.obs;
  RxBool isChanged = false.obs;
  RxBool isLoading = false.obs;
  RxString timeLeft = "0:0".obs;
  RxList<PrQuestion>? prQuestions = <PrQuestion>[].obs;

  String getTimer(double timer, String s) {
    double minute = timer / 60;
    double secoand = timer % 60;
    String m = minute.toString().split(".")[0];
    String s = secoand.toString().split(".")[0];
    timeLeft.value = "$m:$s";
    return "$m:$s";
  }

  Future<void> submitExam() async {
    isLoading.value = true;
    var token = await prefHandler.getUserToken();
    var userID = await prefHandler.getUserId();
    var data = {
      "PR_TOKEN": token,
      "PR_USER": userID,
      "PR_TEST_PAPER": paperID.value,
      "PR_ATTEMPTED": attempt.value,
      "PR_UNATTEMPTED": unattempt.value,
      "PR_TIME_LEFT": timeLeft.value,
      "PR_REVIEW": "",
      "PR_STATUS": 1,
      "PR_TEST_ANSWER": getQuestionResponse()
    };

    ExamProvider().submitExam(
      data: data,
      urlStr: "mobile-api/online-test",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          Get.to(() => ResultView(
                paperId: posts.resObject!,
              ));
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

  getQuestionResponse() {
    var data = [];
    attempt.value = 0;
    unattempt.value = 0;
    prQuestions!.value.forEach((element) {
      if (element.isAttempt) {
        attempt += 1;
        data.add({
          "PR_QUESTION": element.prQuestionId,
          "PR_ANSWER": element.chooseAnswer,
          "PR_TIME_TAKEN": timeLeft.value
        });
      } else {
        unattempt += 1;
      }
    });
    return data;
  }

  void setExamQuestion(ExamQuestionDetails examQuestionDetails) {
    prQuestions!.value = examQuestionDetails.prQuestions!;
    paperID.value = examQuestionDetails.prTestPaperId!;
  }
}
