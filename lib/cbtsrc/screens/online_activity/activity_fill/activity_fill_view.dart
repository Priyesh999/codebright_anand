import 'package:carousel_slider/carousel_slider.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbt_loader.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/online_activity/activity_fill/activity_model.dart';
import 'package:digigyan/cbtsrc/screens/online_learn/vcb_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../constants/api_urls.dart';
import '../../cbt_webview/cbt_webview.dart';
import 'activity_fill_controller.dart';

class CbtFillActivity extends StatelessWidget {
  String title;
  String code;
  int id;
  int chapterId;
  VcbTechModel vcbTechModel;

  CbtFillActivity(
      {required this.title,
      required this.code,
      required this.vcbTechModel,
      required this.id,
      required this.chapterId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CbtFillController());
    return _CbtFillActivityState(
      title: title,
      vcbTechModel: vcbTechModel,
      id: id,
      chapterId: chapterId,
      code: code,
    );
  }
}

class _CbtFillActivityState extends GetView<CbtFillController> {
  String title;
  String code;
  int id;
  int chapterId;
  VcbTechModel vcbTechModel;
  late CarouselController cr = CarouselController();

  _CbtFillActivityState(
      {required this.title,
      required this.code,
      required this.vcbTechModel,
      required this.id,
      required this.chapterId})
      : super();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchActivityData(vcbTechModel, id, chapterId);
    });

    return Obx(() => controller.listActivity.isNotEmpty
        ? Scaffold(
            body: Stack(children: [
             fetchWidget(),
              Visibility(
                visible: controller.acceptedAnswer.value.isNotEmpty,
                child: Positioned(
                  right: 20,
                  bottom: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: false,
                            child: TextButton(
                                child: Card(
                                  color: Colors.redAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CBTTextNew(
                                      "Previous",
                                      style: TStyle.f10_B.styleWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                onPressed: () => {
                                  controller.flashCount.value =
                                      controller.flashCount.value -
                                          1,
                                  cr
                                    ..jumpToPage(
                                        controller.flashCount.value)
                                }),
                          ),
                          Visibility(
                            visible: true,
                            child: TextButton(
                                child: Card(
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CBTTextNew(
                                      "Next",
                                      style: TStyle.f10_B.styleWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                onPressed: () => {
                                  if (controller
                                      .listActivity.length ==
                                      controller.flashCount.value)
                                    {
                                      MethodUtils.showAlertDialog(
                                          context,
                                          "Congratulations",
                                          "",
                                          callback: () => {
                                            controller.isChanged
                                                .value = true,
                                            controller.isClick
                                                .value = false,
                                            controller
                                                .isRightAnswer
                                                .value = false,
                                            controller
                                                .acceptedAnswer
                                                .value = "",
                                            controller
                                                .flashCount
                                                .value = 0,
                                            cr
                                              ..jumpToPage(
                                                  controller
                                                      .flashCount
                                                      .value),
                                            controller.isChanged
                                                .value = false,
                                            Get.back()
                                          }),
                                    }
                                  else
                                    {
                                      controller.isChanged.value =
                                      true,
                                      controller.isClick.value =
                                      false,
                                      controller.isRightAnswer
                                          .value = false,
                                      controller.acceptedAnswer
                                          .value = "",
                                      controller.flashCount.value =
                                          controller.flashCount
                                              .value +
                                              1,
                                      cr
                                        ..jumpToPage(controller
                                            .flashCount.value),
                                      controller.isChanged.value =
                                      false,
                                    }
                                }),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: true,
                        child: TextButton(
                            child: Card(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CBTTextNew(
                                  "${controller.flashCount.value} / ${controller.listActivity.length}",
                                  style: TStyle.f10_B
                                      .styleWith(color: Colors.white),
                                ),
                              ),
                            ),
                            onPressed: () => {}),
                      )
                    ],
                  ),
                ),
              )
            ]),
          )
        : Column(
            children: [
              Expanded(
                flex: 1,
                child: CBTLoaderProgress(
                  isImage: false,
                  isGif: true,
                ),
              ),
            ],
          ));
  }

  fillActivityCards(List<ActivityModel> value) {
    List<Widget> videoWidget = List.empty(growable: true);
    value.forEach((element) {
      videoWidget.add(Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          //DecorationImage
          // border: Border.all(
          //   color: Colors.red.shade100,
          //   width: 1,
          // ), //Border.all
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade50,
              offset: const Offset(
                0.5,
                0.5,
              ), //Offset
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.yellow.shade50,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                children: [
                  Text(
                    element.prQueName!,
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 20),

                  // Obx(() {
                  //   return
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        color: controller.acceptedAnswer.value.isEmpty
                            ? Colors.grey[300]
                            : controller.isRightAnswer.value
                                ? Colors.green[200]
                                : Colors.red[200],
                        borderRadius: BorderRadius.circular(10)),

                    child: DragTarget<String>(
                      onAccept: (value) {
                        controller.setSelectedAnswer(
                            value,
                            value.toLowerCase() ==
                                element.prAnswer!.toLowerCase());
                      },
                      builder: (context, candidates, rejects) {
                        return Center(
                          child: Text(
                            controller.acceptedAnswer.value.isEmpty
                                ? 'Drop Here'
                                : controller.acceptedAnswer.value,
                            style: const TextStyle(fontSize: 24),
                          ),
                        );
                      },
                    ),
                    // );
                    // }
                  ),

                  Visibility(
                    visible: controller.acceptedAnswer.value.isNotEmpty,
                    child: Container(
                      width: 250,
                      height: 250,
                      child: controller.acceptedAnswer.value == element.prAnswer
                          ? Image.asset("assets/gif/right_emg.gif")
                          : Image.asset("assets/gif/wrong_emg.gif"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: controller.answers.value
                    .map(
                      (answer) => Draggable<String>(
                        data: answer,
                        feedback: Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text(
                              answer,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(
                          height: 60,
                          width: 80,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                          child: Container(
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.brown.shade200),
                            child: Center(
                              child: Text(
                                answer,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ));
    });

    return CarouselSlider(
        carouselController: cr,
        items: videoWidget,
        options: CarouselOptions(
          // height: /*GetPlatform.isWeb?700:*/ 300,
          height: MediaQuery.of(Get.context!).size.height,
          // aspectRatio: 16 / 9,
          aspectRatio: 2.0,
          viewportFraction: 1.0,
          initialPage: controller.qCount.value,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          pageSnapping: false,

          pauseAutoPlayOnTouch: false,
          autoPlayInterval: const Duration(minutes: 20),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInCirc,
          enlargeCenterPage: true,
          enlargeFactor: /*GetPlatform.isWeb?0.5:*/ 0.2,
          onPageChanged: (index, reason) => {
            controller.flashCount.value = index,
          },
          // scrollDirection: /*GetPlatform.isWeb?Axis.vertical:*/ Axis.horizontal,
        ));

    // return videoWidget;
  }

  mcqActivityCards(List<ActivityModel> value) {
    List<Widget> videoWidget = List.empty(growable: true);
    value.forEach((element) {
      videoWidget.add(Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          //DecorationImage
          // border: Border.all(
          //   color: Colors.red.shade100,
          //   width: 1,
          // ), //Border.all
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade50,
              offset: const Offset(
                0.5,
                0.5,
              ), //Offset
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.yellow.shade50,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                children: [
                  Text(
                    element.prQueName!,
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 20),

                  // Obx(() {
                  //   return
                  // Container(
                  //   height: 150,
                  //   width: 300,
                  //   decoration: BoxDecoration(
                  //       color: controller.acceptedAnswer.value.isEmpty
                  //           ? Colors.grey[300]
                  //           : controller.isRightAnswer.value
                  //               ? Colors.green[200]
                  //               : Colors.red[200],
                  //       borderRadius: BorderRadius.circular(10)),
                  //
                  //   child: DragTarget<String>(
                  //     onAccept: (value) {
                  //       controller.setSelectedAnswer(
                  //           value,
                  //           value.toLowerCase() ==
                  //               element.prAnswer!.toLowerCase());
                  //     },
                  //     builder: (context, candidates, rejects) {
                  //       return Center(
                  //         child: Text(
                  //           controller.acceptedAnswer.value.isEmpty
                  //               ? 'Drop Here'
                  //               : controller.acceptedAnswer.value,
                  //           style: const TextStyle(fontSize: 24),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  //   // );
                  //   // }
                  // ),

                  Obx(
                    () => controller.isChanged.value
                        ? Visibility(
                            visible: controller.acceptedAnswer.value.isNotEmpty,
                            child: Column(
                              children: [
                                Visibility(
                                  visible: controller
                                      .acceptedAnswer.value.isNotEmpty,
                                  child: Container(
                                    height: 60,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue.withOpacity(0.5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.acceptedAnswer.value,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 250,
                                  child: controller.isRightAnswer.value
                                      ? Image.asset("assets/gif/right_emg.gif")
                                      : Image.asset("assets/gif/wrong_emg.gif"),
                                ),
                              ],
                            ),
                          )
                        : Visibility(
                            visible: controller.acceptedAnswer.value.isNotEmpty,
                            child: Container(
                              width: 250,
                              height: 250,
                              child: controller.isRightAnswer.value
                                  ? Image.asset("assets/gif/right_emg.gif")
                                  : Image.asset("assets/gif/wrong_emg.gif"),
                            ),
                          ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: controller.answers.value
                    .map(
                      (answer) => Draggable<String>(
                        data: answer,
                        feedback: Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text(
                              answer,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(
                          height: 60,
                          width: 80,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                          child: InkWell(
                            onTap: () {
                              controller.isClick.value = true;
                              controller.acceptedAnswer.value = "";
                              controller.setSelectedAnswer(element.prAnswer!,
                                  element.prAnswer == answer);
                            },
                            child: Container(
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.isClick.value &&
                                          element.prAnswer == answer
                                      ? Colors.green.shade300
                                      : element.prAnswer != answer &&
                                              controller.isClick.value
                                          ? Colors.red.shade300
                                          : Colors.brown.shade300),
                              child: Center(
                                child: Text(
                                  answer,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ));
    });

    return CarouselSlider(
        carouselController: cr,
        items: videoWidget,
        options: CarouselOptions(
          // height: /*GetPlatform.isWeb?700:*/ 300,
          height: MediaQuery.of(Get.context!).size.height,
          // aspectRatio: 16 / 9,
          aspectRatio: 2.0,
          viewportFraction: 1.0,
          initialPage: controller.qCount.value,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          pageSnapping: false,

          pauseAutoPlayOnTouch: false,
          autoPlayInterval: const Duration(minutes: 20),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInCirc,
          enlargeCenterPage: true,
          enlargeFactor: /*GetPlatform.isWeb?0.5:*/ 0.2,
          onPageChanged: (index, reason) => {
            controller.flashCount.value = index,
          },
          // scrollDirection: /*GetPlatform.isWeb?Axis.vertical:*/ Axis.horizontal,
        ));

    // return videoWidget;
  }

  GlobalKey _keyTopLeft = GlobalKey();
  GlobalKey _keyBottomLeft = GlobalKey();
  GlobalKey _keyTopRight = GlobalKey();
  GlobalKey _keyBottomRight = GlobalKey();
  List<bool> ongoingSequence = List.filled(4, false);

  matchthePerfact(List<ActivityModel> value) {
    List<Widget> videoWidget = List.empty(growable: true);
    value.forEach((element) {});

    // _letterWidget(
    //   key: _keyTopLeft,
    // );
    // _letterWidget(
    //   key: _keyBottomLeft,
    // );
    // _letterWidget(
    //   key: _keyTopRight,
    // );
    // _letterWidget(
    //   key: _keyBottomRight,
    // );

    videoWidget.add(Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        //DecorationImage
        // border: Border.all(
        //   color: Colors.red.shade100,
        //   width: 1,
        // ), //Border.all
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.red.shade50,
            offset: const Offset(
              0.5,
              0.5,
            ), //Offset
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.yellow.shade50,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: GestureDetector(onPanDown: (DragDownDetails details) {
        ongoingSequence = List.filled(4, false);
        // getDragDownPosition(details);
      }, onPanUpdate: (DragUpdateDetails details) {
        // getDragUpdatePosition(details);
        var result = BoxHitTestResult();
        RenderObject? renderBoxTopLeft =
            _keyTopLeft.currentContext!.findRenderObject();
        RenderObject? renderBoxBottomLeft =
            _keyBottomLeft.currentContext!.findRenderObject();
        RenderObject? renderBoxTopRight =
            _keyTopRight.currentContext!.findRenderObject();
        RenderObject? renderBoxBottomRight =
            _keyBottomRight.currentContext!.findRenderObject();
        if (renderBoxTopLeft!.attached) {
          ongoingSequence[0] = true;
        } else if (renderBoxBottomRight!.attached) {
          ongoingSequence[1] = true;
        } else if (renderBoxTopRight!.attached) {
          ongoingSequence[2] = true;
        } else if (renderBoxBottomRight.attached) {
          ongoingSequence[3] = true;
        }
      }),
    ));

    return CarouselSlider(
        carouselController: cr,
        items: videoWidget,
        options: CarouselOptions(
          // height: /*GetPlatform.isWeb?700:*/ 300,
          height: MediaQuery.of(Get.context!).size.height,
          // aspectRatio: 16 / 9,
          aspectRatio: 2.0,
          viewportFraction: 1.0,
          initialPage: controller.qCount.value,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          pageSnapping: false,

          pauseAutoPlayOnTouch: false,
          autoPlayInterval: const Duration(minutes: 20),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInCirc,
          enlargeCenterPage: true,
          enlargeFactor: /*GetPlatform.isWeb?0.5:*/ 0.2,
          onPageChanged: (index, reason) => {
            controller.flashCount.value = index,
          },
          // scrollDirection: /*GetPlatform.isWeb?Axis.vertical:*/ Axis.horizontal,
        ));

    // return videoWidget;
  }

  getImageSlider1(BuildContext context) {
    List<Widget> bannerWidget = List.empty(growable: true);

    bannerWidget.add(Container(
      width: MediaQuery.of(context).size.width,
      // height: 150,
      //BoxDecoration Widget
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sans_2.png"),
          // image: NetworkImage(ApiUrls.cbtBaseUrl(element!.prUrl!)),
          fit: BoxFit.cover,
        ), //DecorationImage
        border: Border.all(
          color: Colors.lightGreenAccent,
          width: 1,
        ), //Border.all
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.lightGreenAccent,
          //   offset: const Offset(
          //     1.0,
          //     1.0,
          //   ), //Offset
          //   blurRadius: 10.0,
          //   spreadRadius: 2.0,
          // ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ), //BoxDecoration
    ));

    return CarouselSlider(
        carouselController: cr,
        items: bannerWidget,
        options: CarouselOptions(
          // height: /*GetPlatform.isWeb?700:*/ 300,
          height: MediaQuery.of(context).size.height,
          // aspectRatio: 16 / 9,
          aspectRatio: 2.0,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(minutes: 20),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInCirc,
          enlargeCenterPage: true,
          enlargeFactor: /*GetPlatform.isWeb?0.5:*/ 0.2,
          onPageChanged: (index, reason) => {
            controller.flashCount.value = index,
          },
          scrollDirection: /*GetPlatform.isWeb?Axis.vertical:*/ Axis.horizontal,
        ));
  }

 Widget fetchWidget() {
    return  code == "9185"
          ? CbtWebView(
          url: ApiUrls.cbtBaseUrl(
              controller.listActivity.first.prQueName!))
          : Center(
        child: Container(
          child: Column(
            children: [
              Visibility(
                visible: "5024" == code,
                child: Expanded(
                  child: Obx(() =>
                  controller.isChanged.value
                      ? fillActivityCards(
                      controller.listActivity)
                      : fillActivityCards(
                      controller.listActivity)),
                ),
              ),
              Visibility(
                visible: code == "2689",
                child: Expanded(
                  child: Obx(() =>
                  controller.isChanged.value
                      ? mcqActivityCards(
                      controller.listActivity)
                      : mcqActivityCards(
                      controller.listActivity)),
                ),
              ),
              Visibility(
                // visible: code == "2689",
                visible: code == "9185",
                child: Expanded(
                  child: Obx(() =>
                  controller.isChanged.value
                      ? matchthePerfact(
                      controller.listActivity)
                      : matchthePerfact(
                      controller.listActivity)),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
