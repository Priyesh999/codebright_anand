import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/model_exam.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'exam_details_controller.dart';

class ExamDetailsPage extends StatelessWidget {
  ExamQuestionList item;

  ExamDetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    Get.put(ExamDetailsController());
    return ExamDetailsPageState(
      item: item,
    );
  }
}

class ExamDetailsPageState extends GetView<ExamDetailsController> {
  ExamQuestionList item;

  ExamDetailsPageState({required this.item});

  @override
  Widget build(BuildContext context) {
    controller.loadExamQuestion(item);
    return Scaffold(
        appBar: CbtAppBar(
          title: item.prName!,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 45,
            // width: 200,
            child: ElevatedButton(
                style: MethodUtils.raisedButtonStyle(Colors.green),
                onPressed: () => controller.startExam(),
                child: CBTTextNew(
                  "Start Test",
                  style: TStyle.f16_B.styleWith(color: Colors.white),
                )),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? CircularProgressIndicator()
              : Center(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: homeBody(context),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }

  Widget homeBody(BuildContext context) {
    return Container(
      child: _mobile(context),
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.newspaper_outlined,
                    color: Colors.purple,
                    size: 120,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CBTTextNew(
                          controller.examQuestionDetails.value.prName ?? "",
                          style: TStyle.f16_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CBTTextNew(
                        '${controller.examQuestionDetails.value.prTotalQuestions ?? ""}',
                        style: TStyle.f16_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                            color: Colors.black),
                      ),
                      CBTTextNew(
                        'Question',
                        style: TStyle.f12_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CBTTextNew(
                        '${controller.examQuestionDetails.value.prTimeDuration ?? ""} min',
                        style: TStyle.f16_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                            color: Colors.black),
                      ),
                      CBTTextNew(
                        'Duration',
                        style: TStyle.f12_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CBTTextNew(
                        '${controller.examQuestionDetails.value.prTotalMarks ?? ""}',
                        style: TStyle.f16_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                            color: Colors.black),
                      ),
                      CBTTextNew(
                        'Marks',
                        style: TStyle.f12_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: controller
                      .examQuestionDetails.value.prDescription!.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CBTTextNew(
                            controller.examQuestionDetails.value.prDescription!,
                            style: TStyle.f12_R.styleWith(
                              fontFamily: AppFontsNeo.leagueBold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: controller
                      .examQuestionDetails.value.prInstruction!.isNotEmpty,
                  child: CBTTextNew(
                    "Instructions",
                    style: TStyle.f16_B.styleWith(
                      fontFamily: AppFontsNeo.leagueBold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CBTTextNew(
                    controller.examQuestionDetails.value.prInstruction ?? "",
                    style: TStyle.f12_R.styleWith(
                      fontFamily: AppFontsNeo.leagueSemiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  errorMessage(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Alert",
      message: message,
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        // Get.toNamed(Routes.HOME_ADMIN);
      },
    );
  }
}
