import 'package:carousel_slider/carousel_slider.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbt_loader.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/home_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/recent_model.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/flash_card_list/flash_card_list_controller.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/flash_card_list/flash_card_list_view.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/watch_list_model.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/pg_exam.dart';
import 'package:digigyan/cbtsrc/screens/online_learn/pg_online_learn.dart';
import 'package:digigyan/cbtsrc/screens/view_all/controller_view_all.dart';
import 'package:digigyan/cbtsrc/screens/view_all/page_view_all.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: homeBody(context),
        ),
      ),
    );
  }

  Widget homeBody(BuildContext context) {
    Get.put(ViewAllController());
    return Container(
      child: GetPlatform.isWeb || GetPlatform.isWindows || GetPlatform.isWindows
          ? _web(context)
          : _mobile(context),
    );
  }

  Widget _web(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: getImageSlider1(context),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade50,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  // color: Colors.teal.shade50,
                  height: MediaQuery.of(context).size.height,
                  width: 95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: InkWell(
                            onTap: () => {Get.to(() => LearnPage())},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/online_learning.png"),
                                        // fit: BoxFit.cover,
                                      ), //DecorationImage
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                        width: 1,
                                      ), //Border.all
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CBTTextNew(
                                    "Online Learn",
                                    style: TStyle.f10_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: InkWell(
                            onTap: () => {
                              Get.to(ExamPage(
                                examList: [],
                              ))
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/online_exam.png"),
                                        fit: BoxFit.contain,
                                      ), //DecorationImage
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                        width: 1,
                                      ), //Border.all
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CBTTextNew(
                                    "Online Exam",
                                    style: TStyle.f10_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: InkWell(
                            onTap: () => {
                              Get.put(FlashCardGridController()),
                              Get.to(FlashCardGrid())
                              // Get.to(FlashPage())
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 50,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/flash_card.png"),
                                        fit: BoxFit.contain,
                                      ), //DecorationImage
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                        width: 1,
                                      ), //Border.all
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CBTTextNew(
                                    "Flash Cards",
                                    style: TStyle.f10_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: InkWell(
                            onTap: () async {
                              // Get.put(FlashCardGridController()),
                              // Get.to(FlashCardGrid())
                              // Get.to(FlashPage())

                              var res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SimpleBarcodeScannerPage(),
                                  )).then((value) => {
                                    controller.getVideoByScann(value),
                                  });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 50,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/qr_image.png"),
                                        fit: BoxFit.contain,
                                      ), //DecorationImage
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                        width: 1,
                                      ), //Border.all
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CBTTextNew(
                                    "Scann",
                                    style: TStyle.f10_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Obx(() => controller.videoList.isEmpty &
                        controller.pdfList.isEmpty
                    ? Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CBTLoaderProgress(
                              isImage: false,
                              isGif: true,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Visibility(
                                    visible:
                                        controller.videoList.value.isNotEmpty,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CBTTextNew(
                                                "Recent Videos (${controller.videoCurrentCountNo.value}/${controller.videoList.value.length})",
                                                style: TStyle.f8_B.style,
                                                textAlign: TextAlign.start,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(ViewListPage(
                                                    title: "Recent Video",
                                                    typeScreen:
                                                        TypeScreen.CBT_VIDEO,
                                                  ));
                                                },
                                                child: CBTTextNew(
                                                  "View All",
                                                  style: TStyle.f7_B.style,
                                                ),
                                              )
                                            ],
                                          ),
                                          Expanded(
                                              child: recentVideo(
                                            controller.videoList.value,
                                            context,
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Visibility(
                                    visible:
                                        controller.pdfList.value.isNotEmpty,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        children: [
                                          CBTTextNew(
                                            "Recent Pdf (${controller.pdfCuurenCountNo.value}/${controller.pdfList.value.length})",
                                            style: TStyle.f12_B.style,
                                            textAlign: TextAlign.start,
                                          ),
                                          recentPdf(
                                            controller.pdfList.value,
                                            context,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
              ),
            ],
          )),
        ),
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: getImageSlider1(context),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade50,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  // color: Colors.teal.shade50,
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: InkWell(
                            onTap: () => {Get.to(LearnPage())},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/e_learnig.gif"),
                                        // fit: BoxFit.cover,
                                      ), //DecorationImage
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                        width: 1,
                                      ), //Border.all
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CBTTextNew(
                                    "Learn",
                                    style: TStyle.f10_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: InkWell(
                            onTap: () => {
                              Get.to(ExamPage(
                                examList: [],
                              ))
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/exam.gif"),
                                        fit: BoxFit.contain,
                                      ), //DecorationImage
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                        width: 1,
                                      ), //Border.all
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CBTTextNew(
                                    "Exam",
                                    style: TStyle.f8_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: InkWell(
                            onTap: () => {
                              Get.put(FlashCardGridController()),
                              Get.to(FlashCardGrid())
                              // Get.to(FlashPage())
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/slide.gif"),
                                        fit: BoxFit.contain,
                                      ), //DecorationImage
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                        width: 1,
                                      ), //Border.all
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CBTTextNew(
                                    "Flash",
                                    style: TStyle.f8_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: InkWell(
                            onTap: () async {
                              // Get.put(FlashCardGridController()),
                              // Get.to(FlashCardGrid())
                              // Get.to(FlashPage())

                              var res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const SimpleBarcodeScannerPage(),
                                  )).then((value) => {
                                controller.getVideoByScann(value),
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/barcode_scan.gif"),
                                        fit: BoxFit.contain,
                                      ), //DecorationImage
                                      border: Border.all(
                                        color: Colors.lightGreenAccent,
                                        width: 1,
                                      ), //Border.all
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), //Offset
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CBTTextNew(
                                    "Scann",
                                    style: TStyle.f8_B.styleWith(
                                        fontFamily: AppFontsNeo.leagueBold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Obx(
                  () => controller.videoList.isEmpty &
                          controller.pdfList.isEmpty
                      ? Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CBTLoaderProgress(
                                isImage: false,
                                isGif: true,
                              ),
                            ),
                          ],
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Visibility(
                                visible: controller.videoList.value.isNotEmpty,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CBTTextNew(
                                              "Videos (${controller.videoCurrentCountNo.value}/${controller.videoList.value.length})",
                                              style: TStyle.f8_B.style,
                                              textAlign: TextAlign.start,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(ViewListPage(
                                                    title: "All Video",
                                                    typeScreen:
                                                        TypeScreen.CBT_VIDEO));
                                              },
                                              child: CBTTextNew(
                                                "View All",
                                                style: TStyle.f7_B.styleWith(
                                                    color: Colors.purple),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      recentVideo(
                                        controller.videoList.value,
                                        context,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: controller.pdfList.value.isNotEmpty,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CBTTextNew(
                                              "Pdf (${controller.pdfCuurenCountNo.value}/${controller.pdfList.value.length})",
                                              style: TStyle.f8_B.style,
                                              textAlign: TextAlign.start,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(ViewListPage(
                                                    title: "All Pdf",
                                                    typeScreen:
                                                        TypeScreen.CBT_PDF));
                                              },
                                              child: CBTTextNew(
                                                "View All",
                                                style: TStyle.f7_B.styleWith(
                                                    color: Colors.purple),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      recentPdf(
                                        controller.pdfList.value,
                                        context,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  getImageSlider1(BuildContext context) {
    List<Widget> bannerWidget = List.empty(growable: true);

    controller.bannerList.forEach((element) {
      bannerWidget.add(Container(
        width: MediaQuery.of(context).size.width,
        // height: 150,
        //BoxDecoration Widget
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(ApiUrls.cbtBaseUrl(element!.prUrl!)),
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
    });

    return CarouselSlider(
        items: bannerWidget,
        options: CarouselOptions(
          height: /*GetPlatform.isWeb?700:*/ 400,
          // aspectRatio: 16 / 9,
          aspectRatio: 2.0,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInCirc,
          enlargeCenterPage: true,
          enlargeFactor: /*GetPlatform.isWeb?0.5:*/ 0.2,
          // onPageChanged: callbackFunction,
          scrollDirection: /*GetPlatform.isWeb?Axis.vertical:*/ Axis.horizontal,
        ));
  }

  recentVideo(List<PrVodeoDatum> value, BuildContext context) {
    return CarouselSlider(
        items: controller.getVideoList(value, context),
        options: CarouselOptions(
          height: GetPlatform.isWeb ? 300 : 200,
          // aspectRatio: 16 / 9,
          aspectRatio: 2.0,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInCirc,
          enlargeCenterPage: true,
          enlargeFactor: GetPlatform.isWeb ? 0.5 : 0.1,
          // onPageChanged: controller_view_all.dart.callbackFunction(),
          onPageChanged: (index, reason) => {
            controller.videoCurrentCountNo.value = index + 1,
          },
          scrollDirection:
              GetPlatform.isWeb ? Axis.horizontal : Axis.horizontal,
        ));
  }

  recentPdf(List<PrPdfDatum> value, BuildContext context) {
    return CarouselSlider(
        items: controller.getPdfList(value, context),
        options: CarouselOptions(
          height: GetPlatform.isWeb ? 300 : 200,
          // aspectRatio: 16 / 9,
          aspectRatio: 2.0,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 8),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInCirc,
          enlargeCenterPage: true,
          enlargeFactor: GetPlatform.isWeb ? 0.5 : 0.1,
          // onPageChanged: controller_view_all.dart.callbackFunction(),
          onPageChanged: (index, reason) => {
            controller.pdfCuurenCountNo.value = index + 1,
          },
          scrollDirection: GetPlatform.isWeb ? Axis.vertical : Axis.horizontal,
        ));
  }

// recentSimulation(List<PrSimulationDatum> value, BuildContext context) {
//   return CarouselSlider(
//       items: controller.getSimulationList(value, context),
//       options: CarouselOptions(
//         height: GetPlatform.isWeb ? 200 : 135,
//         // aspectRatio: 16 / 9,
//         aspectRatio: 2.0,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 5),
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         autoPlayCurve: Curves.easeInCirc,
//         enlargeCenterPage: true,
//         enlargeFactor: GetPlatform.isWeb ? 0.5 : 0.1,
//         // onPageChanged: controller_view_all.dart.callbackFunction(),
//         onPageChanged: (index, reason) => {
//           controller.simulationCountNo.value = index + 1,
//         },
//         scrollDirection: GetPlatform.isWeb ? Axis.vertical : Axis.horizontal,
//       ));
// }

// recentFlip(List<PrDatum> value, BuildContext context) {
//   return CarouselSlider(
//       items: controller.getPdfList(value, context),
//       options: CarouselOptions(
//         height: GetPlatform.isWeb ? 200 : 135,
//         // aspectRatio: 16 / 9,
//         aspectRatio: 2.0,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 5),
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         autoPlayCurve: Curves.easeInCirc,
//         enlargeCenterPage: true,
//         enlargeFactor: GetPlatform.isWeb ? 0.5 : 0.1,
//         // onPageChanged: controller_view_all.dart.callbackFunction(),
//         onPageChanged: (index, reason) => {
//           controller.flipCountNo.value = index + 1,
//         },
//         scrollDirection: GetPlatform.isWeb ? Axis.vertical : Axis.horizontal,
//       ));
// }
}
