import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/controller_exam.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/exam_details/exam_details_controller.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/exam_details/exam_details_view.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/model_exam.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamPage extends StatelessWidget {
  String title;
  int bookId;
  List<ExamQuestionList> examList;


  ExamPage({this.title = "Online Exam",this.bookId=0,required this.examList});
  @override
  Widget build(BuildContext context) {
    Get.put(ExamController());
    return ExamPageState(title: title,bookId: bookId,examList: examList,);
  }
}

class ExamPageState extends GetView<ExamController> {
  String title;
  int bookId;
  List<ExamQuestionList> examList;

  ExamPageState({this.title = "Online Exam",this.bookId=0,required this.examList});

  @override
  Widget build(BuildContext context) {
    controller.loadExamQuestion();
    return Obx(() => Scaffold(
          appBar: CbtAppBar(
            title: title,
          ),
          body: Center(
            child: Container(
              child: Column(
                children: [
                  tabsWidget(context),
                  Expanded(
                    child: homeBody(controller.subjectList.value,
                        controller.bannerList.value, context),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget homeBody(List<DigiGyanModel?> homeData, List<String?> bannerResponse,
      BuildContext context) {
    return Container(
      child: _mobile(context),
    );
  }

  Widget tabsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Obx(
            () => CupertinoSegmentedControl<String>(
              children: tabs([
                "Analysis",
                "Unattempted",
                "Attempted",
                "Recommended",
                // "  MULTI CITY  ",
              ]),
              // padding: EdgeInsets.only(bottom: 8,top: 8),
              borderColor: Colors.grey,
              selectedColor: Colors.lightBlue,
              padding: const EdgeInsets.only(bottom: 3, top: 3),
              pressedColor: Colors.blueAccent,
              unselectedColor: Colors.white,
              onValueChanged: (String val) {
                controller.sharedValue.value = val;
                controller.onUpdateValue(val);
              },
              groupValue: controller.sharedValue.value,
            ),
          )),
    );
  }

  Map<String, Widget> tabs(List<String> getDcs) {
    Map<String, Widget> data = {};
    for (var i = 0; i < getDcs.length; i++) {
      data[getDcs[i]] = getDcs[i] == controller.sharedValue.value
          ? CBTTextNew(
              getDcs[i],
              style: TStyle.f8_B.styleWith(color: Colors.white),
            )
          : CBTTextNew(
              getDcs[i],
              style:
                  TStyle.f8_B.styleWith(color: CodebrightColor.cbtPrimarColor),
            );
    }
    return data;
  }

  Widget _mobile(BuildContext context) {
    return controller.sharedValue == "Analysis"
        ? analysis(context)
        : Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    child: Column(
                  children: getExamList(controller.examList.value),
                )),
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

  Widget analysis(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.yellow.shade50,
          margin: EdgeInsets.all(8),
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CBTTextNew(
                        "Report Card of ",
                        style: TStyle.f14_S.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                      ),
                      CBTTextNew(
                        controller.analysReport!.value.prUser!.prName! ?? "",
                        style: TStyle.f14_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.do_not_disturb_on_total_silence,
                      color: Colors.blueAccent,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CBTTextNew(
                        "Test Attempted",
                        style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                      ),
                    ),
                    CBTTextNew(
                      controller.analysReport!.value.prTestAttempted!
                          .toString(),
                      style: TStyle.f12_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: Colors.blueAccent),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10),
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.done_all,
                      color: Colors.green,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CBTTextNew(
                        "Correct Answers",
                        style: TStyle.f10_B
                            .styleWith(fontFamily: AppFontsNeo.leagueBold),
                      ),
                    ),
                    CBTTextNew(
                      controller.analysReport!.value.prCurrectAnswers!
                          .toString(),
                      style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: Colors.green),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10),
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CBTTextNew(
                        "Incorrect Answers",
                        style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                      ),
                    ),
                    CBTTextNew(
                      controller.analysReport!.value.prIncurrectAnswers!
                          .toString(),
                      style: TStyle.f12_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10),
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.query_stats,
                      color: Colors.greenAccent,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CBTTextNew(
                        "Question Attempted",
                        style: TStyle.f10_B
                            .styleWith(fontFamily: AppFontsNeo.leagueBold),
                      ),
                    ),
                    CBTTextNew(
                      controller.analysReport!.value.prAttemptedQues!
                          .toString(),
                      style: TStyle.f12_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: Colors.greenAccent),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10),
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.not_interested_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CBTTextNew(
                        "Question Unattempted",
                        style: TStyle.f10_B
                            .styleWith(fontFamily: AppFontsNeo.leagueBold),
                      ),
                    ),
                    CBTTextNew(
                      controller.analysReport!.value.prUnattemptedQues!
                          .toString(),
                      style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.brown.shade50,
          margin: EdgeInsets.all(8),
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CBTTextNew(
                        "Spent Learning ",
                        style: TStyle.f14_S.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                      ),
                      CBTTextNew(
                        "",
                        style: TStyle.f14_B.styleWith(
                            fontFamily: AppFontsNeo.leagueBold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.slow_motion_video_outlined,
                      color: Colors.purple,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CBTTextNew(
                        "Videos Watched",
                        style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                      ),
                    ),
                    CBTTextNew(
                      controller.analysReport!.value.prWatchVideos!.toString(),
                      style: TStyle.f12_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: Colors.blueAccent),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10),
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.picture_as_pdf,
                      color: Colors.green,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CBTTextNew(
                        "Docs Viewed",
                        style: TStyle.f10_B
                            .styleWith(fontFamily: AppFontsNeo.leagueBold),
                      ),
                    ),
                    CBTTextNew(
                      controller.analysReport!.value.prWatchDoc!.toString(),
                      style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: Colors.green),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10),
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.teal.shade50,
          margin: EdgeInsets.all(8),
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CBTTextNew(
                            "Percentile ",
                            style: TStyle.f14_S.styleWith(
                              fontFamily: AppFontsNeo.leagueBold,
                            ),
                          ),
                          CBTTextNew(
                            "38.9%",
                            style: TStyle.f14_B.styleWith(
                                fontFamily: AppFontsNeo.leagueBold,
                                color: Colors.teal),
                          ),
                        ],
                      ),
                      CBTTextNew(
                        "504 students(out of 1205) are scorin less than you ",
                        style: TStyle.f10_S.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.request_quote_outlined,
                      color: Colors.purple,
                      size: 24,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CBTTextNew(
                        "Attempt ",
                        style: TStyle.f10_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                        ),
                      ),
                    ),
                    CBTTextNew(
                      "41.43%",
                      style: TStyle.f12_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: Colors.purple),
                    )
                  ],
                ),
                CBTTextNew(
                  "you have attempted 29 question in 6 tests",
                  style: TStyle.f12_B.styleWith(
                      fontFamily: AppFontsNeo.leagueBold,
                      color: Colors.purpleAccent),
                  maxLine: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10),
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> getExamList(List<ExamQuestionList> examList) {
    List<Widget> resWidget = List.empty(growable: true);

    examList.forEach((element) {
      resWidget.add(InkWell(
        onTap: () => {Get.to(ExamDetailsPage(item: element))},
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.newspaper_outlined,
                  color: Colors.purple,
                  size: 32,
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
                        element.prName ?? "",
                        style: TStyle.f12_M.styleWith(
                          fontFamily: AppFontsNeo.leagueMedium,
                        ),
                      ),
                      Row(
                        children: [
                          CBTTextNew(
                            '${element.prQuestions!.length ?? ""} Question',
                            style: TStyle.f10_M.styleWith(
                              fontFamily: AppFontsNeo.leagueMedium,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CBTTextNew(
                            '${element.prTimeDuration ?? ""} min',
                            style: TStyle.f10_M.styleWith(
                              fontFamily: AppFontsNeo.leagueMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });

    return resWidget;
  }
}
