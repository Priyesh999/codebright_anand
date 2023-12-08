import 'package:digigyan/cbtsrc/screens/online_exam/exam_details_model.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/online_live_exam/live_exam_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../cbt_helpers/app_utilities/method_utils.dart';
import '../../../cbt_helpers/dxwidget/codebright_text.dart';
import '../../widgets/styles/text_style.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class LiveExamView extends StatelessWidget {
  final ExamQuestionDetails examQuestionDetails;

  LiveExamView({required this.examQuestionDetails});

  @override
  Widget build(BuildContext context) {
    Get.put(LiveExamController());
    return _LiveExamState(examQuestionDetails: examQuestionDetails);
  }
}

class _LiveExamState extends GetView<LiveExamController> {
  final ExamQuestionDetails examQuestionDetails;

  _LiveExamState({required this.examQuestionDetails});

  @override
  Widget build(BuildContext context) {
    controller.setExamQuestion(examQuestionDetails);
    return WillPopScope(
      onWillPop: () async {
        if (1 == 1) {
          Get.bottomSheet(
              Container(
                child: Card(
                  margin: EdgeInsets.all(8),
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => {
                        // if (controller.isAdd.value)
                        //   {
                        //     controller.onUpdateListClick(index,
                        //         isView: controller.isView.value,
                        //         isDelete: controller.isDelete.value),
                        //   }

                        // controller.onReady()
                      },
                      child: ListTile(
                        onTap: () {
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                        title: CBTTextNew(
                          "demo",
                          style: TStyle.f16_B
                              .styleWith(fontFamily: AppFontsNeo.leagueBold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              enableDrag: true);
          return false;
        } else {
          return true;
        }
      },
      child: Obx(
          () => controller.isChanged.value ? _widgetScaff() : _widgetScaff()),
    );
  }

  Widget _widgetScaff() {
    return Scaffold(
      appBar: CbtAppBarCBT(
        title: Row(
          children: [
            Expanded(
              child: CBTTextNew(
                examQuestionDetails.prName!,
                style:
                    TStyle.f16_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
              ),
            ),
            SizedBox(
              height: 30,
              child: Card(
                color: Colors.teal.shade400,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                  child: Countdown(
                    seconds:
                        int.parse(examQuestionDetails.prTimeDuration!) * 60,
                    build: (BuildContext context, double time) => CBTTextNew(
                      controller.getTimer(
                          time, examQuestionDetails.prTimeDuration!),
                      textAlign: TextAlign.center,
                      style: TStyle.f10_B.styleWith(color: Colors.white),
                    ),
                    interval: Duration(seconds: 1),
                    onFinished: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 40,
                child: Visibility(
                  visible: controller.isSelectedPosition.value > 0,
                  child: ElevatedButton(
                      style: MethodUtils.raisedButtonStyle(Colors.green),
                      onPressed: () {
                        controller.isChanged.value = false;
                        controller.isSelectedPosition.value -= 1;
                        controller.isChanged.value = false;
                      },
                      child: CBTTextNew(
                        "Previous",
                        style: TStyle.f16_B.styleWith(color: Colors.white),
                      )),
                ),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 40,
                child: examQuestionDetails.prQuestions!.length ==
                        (controller.isSelectedPosition.value + 1)
                    ? ElevatedButton(
                        style: MethodUtils.raisedButtonStyle(Colors.teal),
                        onPressed: () => {controller.submitExam()},
                        child: CBTTextNew(
                          "Submit",
                          style: TStyle.f16_B.styleWith(color: Colors.white),
                        ))
                    : ElevatedButton(
                        style: MethodUtils.raisedButtonStyle(Colors.green),
                        onPressed: () {
                          controller.isChanged.value = false;
                          controller.isSelectedPosition.value += 1;
                          controller.isChanged.value = true;
                        },
                        child: CBTTextNew(
                          "Next",
                          style: TStyle.f16_B.styleWith(color: Colors.white),
                        )),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CBTTextNew(
                                  "${controller.isSelectedPosition.value + 1} . ",
                                  style: TStyle.f16_B.styleWith(
                                      fontFamily: AppFontsNeo.leagueBold)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CBTTextNew(
                                      examQuestionDetails
                                          .prQuestions![controller
                                              .isSelectedPosition.value]
                                          .prQuestion!,
                                      style: TStyle.f16_B.styleWith(
                                          fontFamily: AppFontsNeo.leagueBold),
                                    ),
                                    CBTTextNew(
                                      examQuestionDetails
                                          .prQuestions![controller
                                              .isSelectedPosition.value]
                                          .prDescription!,
                                      style: TStyle.f14_R.styleWith(
                                          fontFamily: AppFontsNeo.leagueBold),
                                    ),
                                  ],
                                ),
                              ),
                              CBTTextNew(
                                  "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prMarks!}",
                                  style: TStyle.f16_B.styleWith(
                                      fontFamily: AppFontsNeo.leagueBold)),
                            ],
                          ),
                          CustomRadioButton(
                            enableShape: false,
                            elevation: 0,
                            wrapAlignment: WrapAlignment.start,

                            defaultSelected: examQuestionDetails
                                    .prQuestions![
                                        controller.isSelectedPosition.value]
                                    .isAttempt
                                ? examQuestionDetails
                                    .prQuestions![
                                        controller.isSelectedPosition.value]
                                    .chooseAnswer
                                : null,
                            enableButtonWrap: false,
                            horizontal: true,

                            // width: 120,
                            autoWidth: true,
                            unSelectedColor: Theme.of(Get.context!).canvasColor,
                            buttonLables: [
                              "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prFirstOption!}",
                              "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prSecondOption!}",
                              "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prThirdOption!}",
                              "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prFourthOption!}",
                            ],
                            buttonValues: [
                              "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prFirstOption!}",
                              "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prSecondOption!}",
                              "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prThirdOption!}",
                              "${examQuestionDetails.prQuestions![controller.isSelectedPosition.value].prFourthOption!}",
                            ],
                            radioButtonValue: (value) {
                              controller.isChanged.value = false;
                              examQuestionDetails
                                  .prQuestions![
                                      controller.isSelectedPosition.value]
                                  .isAttempt = true;
                              examQuestionDetails
                                  .prQuestions![
                                      controller.isSelectedPosition.value]
                                  .chooseAnswer = value;
                              controller.isChanged.value = true;
                            },

                            selectedColor:
                                Theme.of(Get.context!).colorScheme.secondary,
                            // Theme.of(context).canvasColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
