import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/result/result_view_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cbt_helpers/cbt_loader.dart';

class ResultView extends StatelessWidget {
  final int paperId;

  ResultView({required this.paperId});

  @override
  Widget build(BuildContext context) {
    Get.put(ResultController());
    return _ResultViewState(paperId: paperId);
  }
}

class _ResultViewState extends GetView<ResultController> {
  final int paperId;

  _ResultViewState({required this.paperId});

  @override
  Widget build(BuildContext context) {
    controller.setPaperId(paperId);
    return _widgetScaff();
  }

  Widget _widgetScaff() {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        Get.back();
        Get.back();

        return true;
      },
      child: Obx(() => controller.isLoading.value
          ? CBTLoaderProgress()
          : Scaffold(
              appBar: CbtAppBarCBT(
                title: Row(
                  children: [
                    Expanded(
                      child: CBTTextNew(
                        controller.analysReport!.value.prUser!.prName!,
                        style: TStyle.f16_B
                            .styleWith(fontFamily: AppFontsNeo.leagueBold),
                      ),
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
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
                                      controller
                                          .analysReport!.value.prUser!.prName!,
                                      style: TStyle.f14_B.styleWith(
                                          fontFamily: AppFontsNeo.leagueBold,
                                          color: Colors.teal),
                                    ),
                                  ],
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.do_not_disturb_on_total_silence,
                              //       color: Colors.blueAccent,
                              //       size: 24,
                              //     ),
                              //     SizedBox(
                              //       width: 6,
                              //     ),
                              //     Expanded(
                              //       child: CBTTextNew(
                              //         "Test Attempted",
                              //         style: TStyle.f10_B.styleWith(
                              //           fontFamily: AppFontsNeo.leagueBold,
                              //         ),
                              //       ),
                              //     ),
                              //     CBTTextNew(
                              //       controller.analysReport!.value.prAttemptedQues!.toString(),
                              //       style: TStyle.f12_B.styleWith(
                              //           fontFamily: AppFontsNeo.leagueBold,
                              //           color: Colors.blueAccent),
                              //     )
                              //   ],
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 10),
                                child: Container(
                                  height: 0.5,
                                  width: MediaQuery.of(Get.context!).size.width,
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
                                      style: TStyle.f10_B.styleWith(
                                          fontFamily: AppFontsNeo.leagueBold),
                                    ),
                                  ),
                                  CBTTextNew(
                                    controller
                                        .analysReport!.value.prCurrectAnswers!
                                        .toString(),
                                    style: TStyle.f10_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold,
                                        color: Colors.green),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 10),
                                child: Container(
                                  height: 0.5,
                                  width: MediaQuery.of(Get.context!).size.width,
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
                                    controller
                                        .analysReport!.value.prIncurrectAnswers!
                                        .toString(),
                                    style: TStyle.f12_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold,
                                        color: Colors.red),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 10),
                                child: Container(
                                  height: 0.5,
                                  width: MediaQuery.of(Get.context!).size.width,
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
                                      style: TStyle.f10_B.styleWith(
                                          fontFamily: AppFontsNeo.leagueBold),
                                    ),
                                  ),
                                  CBTTextNew(
                                    controller
                                        .analysReport!.value.prAttemptedQues!
                                        .toString(),
                                    style: TStyle.f12_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold,
                                        color: Colors.greenAccent),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 10),
                                child: Container(
                                  height: 0.5,
                                  width: MediaQuery.of(Get.context!).size.width,
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
                                      style: TStyle.f10_B.styleWith(
                                          fontFamily: AppFontsNeo.leagueBold),
                                    ),
                                  ),
                                  CBTTextNew(
                                    controller
                                        .analysReport!.value.prUnattemptedQues!
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
                                      "Leaderboard",
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
                                children: [],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              fontFamily:
                                                  AppFontsNeo.leagueBold,
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
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 10),
                                child: Container(
                                  height: 0.5,
                                  width: MediaQuery.of(Get.context!).size.width,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),

    );
  }
}
