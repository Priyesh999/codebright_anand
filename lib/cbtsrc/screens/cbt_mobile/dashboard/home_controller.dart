import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/constants/app_config.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designaton_list_form_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/video_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/banner_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/recent_model.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/controller_flas.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/controller_flash.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../constants/ui_controls.dart';
import '../../cbt_admin/category_list/category_lf_form/company_form_controller.dart';
import '../../cbt_admin/common_master/designation/designation_form_view.dart';
import '../../scanned_data/scanned_mobile_viewer.dart';
import '../../scanned_data/scanned_video_file.dart';

class HomeController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();

  // final RxList<MenuModel?> menuList = <MenuModel>[].obs;
  final RxList<BannerModel?> bannerList = <BannerModel>[].obs;

  // LocationData? location = null;

  RxString categoryID = "".obs;
  RxString classID = "".obs;
  RxString categoryName = "".obs;
  RxString className = "".obs;

  // final RxList<BannerModel?> subjectList = <BannerModel>[].obs;
  // final RxList<BannerModel> subjectListCopy = <BannerModel>[].obs;
  final RxList<PrVodeoDatum> videoList = <PrVodeoDatum>[].obs;
  final RxList<PrPdfDatum> pdfList = <PrPdfDatum>[].obs;
  final RxList<PrVodeoDatum> flipList = <PrVodeoDatum>[].obs;

  late BuildContext _context;

  final RxBool isLoading = true.obs;
  final RxInt videoCurrentCountNo = 1.obs;
  final RxInt pdfCuurenCountNo = 1.obs;
  final RxInt simulationCountNo = 1.obs;
  final RxInt flipCountNo = 1.obs;

  @override
  void onReady() async {
    // Get.put(FlashController());
    // Get.put(FlashNewsController());
    Get.put(VideoController());
  }

  void openMenu(DigiGyanModel phMenu) async {
    Get.to(() => DesignationLFView(phMenu), binding: DesignationLFBinding());
  }

  void logout() {}

  Future<void> loadBanner({bool isGoBack = false}) async {
    isLoading.value = true;
    var userToken = await prefHandler.getUserToken();
    CbtLFProvider().getPostsListByUrlBanner(
      data: {
        /*"PR_APP_VERSION": AppConfigs().apiVersion, */
        "PR_TOKEN": userToken
      },
      urlStr: "common-api/banner-list",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          bannerList.value.clear();
          bannerList.value.clear();
          bannerList.value = posts.resObject!;
          bannerList.value = posts.resObject!;
        } else {
          // bannerList.value = [];
          // bannerList.value = [];
        }
        if (isGoBack) {
          Get.back();
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        // loadSubject();
        // bannerList.value.clear();
        // bannerList.value.clear();
        isLoading.value = false;
        // update();
        // print("Error");
        // loadSubject();
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }

  Future<void> loadRecent({bool isGoBack = false}) async {
    isLoading.value = true;
    // var classId = await prefHandler.getClassId();
    var token = await prefHandler.getUserToken();
    CbtLFProvider().getPostsListByUrlRecent(
      data: {"PR_APP_VERSION":AppConfigs().apiVersion, "PR_TOKEN": token},
      // urlStr: "recent-data-list",
      urlStr: "mobile-api/recent-data",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          videoList.value.clear();
          pdfList.value.clear();
          videoList.value = posts.resObject!.prVodeoData!;
          pdfList.value = posts.resObject!.prPdfData!;
        } else {
          videoList.value = [];
          pdfList.value = [];
        }

        if (isGoBack) {
          Get.back();
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        // loadSubject();
        videoList.value.clear();
        pdfList.value.clear();
        isLoading.value = false;
        // update();
        // print("Error");
        // loadSubject();
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

    await loadBanner();
    Future.delayed(Duration(seconds: 1), () async {
      await loadRecent();
    });
  }

  @override
  void onInit() {
    setUserDetails();
    super.onInit();
  }

  List<Widget> getVideoList(List<PrVodeoDatum> value, BuildContext context) {
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
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Row(
          children: [
            GetPlatform.isWindows || GetPlatform.isWeb
                ? Container(
                    height: 150,
                    width: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                            child: Container(
                          width: 150,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  ApiUrls.baseUrlImage(element.prBook?.prIcon)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ],
                    ))
                : Container(
                    height: 150,
                    width: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                            child: Container(
                          width: 150,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  YoutubePlayer.getThumbnail(
                                      videoId: YoutubePlayer.convertUrlToId(
                                              element.prVideoUrl!) ??
                                          '')),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                        Visibility(
                          visible: true,
                          child: Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 35,
                          ),
                        )
                      ],
                    )),
            SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 12,
                  right: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CBTTextNew(
                      element.prName!,
                      style: TStyle.f10_B
                          .styleWith(fontFamily: AppFontsNeo.leagueBold),
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prBook!.prName!,
                      style: TStyle.f10_S.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                      maxLine: 5,
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prCategory!.prName!,
                      style: TStyle.f10_B.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                      maxLine: 5,
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prDescription ?? "",
                      style: TStyle.f10_S.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                      maxLine: 5,
                    ),
                    // Container(
                    //   alignment: Alignment.centerRight,
                    //   child: ElevatedButton(
                    //       onPressed: () {
                    //         Get.to(() => NuggetsScreen(currentIndex:isSelectedPosition));
                    //         // gotoYoutubePlayer(
                    //         //     videourl: post.image,
                    //         //     appBarName: post.title,
                    //         //     description: topicModel!.prDescription!);
                    //       },
                    //       style: MethodUtils.raisedButtonStyle(
                    //           materialPrimaryColor),
                    //       child: DxTextWhite(
                    //         "View More",
                    //         mBold: true,
                    //       )),
                    // ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            )
          ],
        ),
      ));
    });

    return videoWidget;
  }

  List<Widget> getPdfList(List<PrPdfDatum> value, BuildContext context) {
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
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0,right: 10),
          child: Row(
            children: [
              Container(
                  height: 200,
                  width: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                          child: Container(
                        width: 150,
                        // margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                ApiUrls.baseUrlImage(element.prBook?.prIcon!)),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                    ],
                  )),
              SizedBox(width: 5),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CBTTextNew(
                        element.prName ?? "",
                        style: TStyle.f10_B
                            .styleWith(fontFamily: AppFontsNeo.leagueBold),
                      ),
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prBook?.prName ?? "",
                      style: TStyle.f10_S.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                      maxLine: 5,
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prCategory?.prName ?? "",
                      style: TStyle.f10_S.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                      maxLine: 5,
                    ),
                    SizedBox(height: 8),
                    CBTTextNew(
                      element.prDescription ?? "",
                      style: TStyle.f10_S.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                      maxLine: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    });

    return videoWidget;
  }

  Future<void> getVideoByScann(String res) async {
    isLoading.value = true;
    var userToken = await prefHandler.getUserToken();
    CbtLFProvider().getPostQr(
      data: {"PR_TOKEN": userToken, "PR_QR_CODE": res},
      urlStr: "school-api/video-data-by-qrcode",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          if (GetPlatform.isWeb) {
            Get.to(() => ScannedViewer(
              vcbTechModel: posts.resObject!.videoUrl!,
              title: posts.resObject!.title!,
              description: posts.resObject!.subTitle!,
            ));
          } else {
            Get.to(() {
              ScannedMobileView(
                vcbTechModel: posts.resObject!.videoUrl!,
                title: posts.resObject!.title!,
                description: posts.resObject!.subTitle!,
              );
            });
          }
        }
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }
}
