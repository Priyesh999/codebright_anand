import 'dart:io';

import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_student/cbt_student_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_student/cbt_student_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/youtubePlayer.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/exam_details/exam_details_view.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/repo_exam.dart';
import 'package:digigyan/cbtsrc/screens/online_learn/vcb_model.dart';
import 'package:digigyan/cbtsrc/screens/online_tg/online_tg_controller.dart';
import 'package:digigyan/cbtsrc/screens/online_tg/online_tg_view.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/controller_test_home.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/main_test_geration_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../cbt_model/cbt_common_model.dart';
import '../../../../cbt_model/response.dart';
import '../../../../constants/ui_controls.dart';
import '../../../../utils/appImages.dart';
import '../../../cbt_webview/cbt_webview.dart';

import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../../../flash_card/flash_card_list/flash_card_list_model.dart';
import '../../../flash_card/page_flas.dart';
import '../../../online_activity/activity_fill/activity_fill_view.dart';
import '../../../online_exam/model_exam.dart';
import '../../../online_exam/pg_exam.dart';
import '../../../online_learn/repo_online_learn.dart';
import '../../sub_master/cbt_video/player_type_enum.dart';

class DesignationLFController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isBtnLoading = false.obs;
  final RxBool isAdd = false.obs;
  final RxInt currentPage = 1.obs;
  final RxBool isView = true.obs;
  final RxList<CBTCommonModel> desDataList = <CBTCommonModel>[].obs;
  final RxString title = "".obs;
  final RxInt isSelectedPosition = 10000.obs;
  Rx<VcbTechModel?> vcbTechModel = VcbTechModel().obs;

  DigiGyanModel? cbtCommonModel;

  BuildContext? mContext;

  @override
  void onReady() async {
    // await loadDesignation();
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> loadDesignation(
      DigiGyanModel cbtCommonModel1, BuildContext context,
      {bool isGoBack = false}) async {
    this.cbtCommonModel = cbtCommonModel1;
    mContext = context;
    desDataList.value.clear();
    desDataList.value.insert(
        0,
        CBTCommonModel(
            id: "1",
            title: "Video",
            image: AppImages.video,
            originalModel: ""));
    desDataList.value.insert(
        1,
        CBTCommonModel(
            id: "2", title: "Ebook", image: AppImages.pdf, originalModel: ""));
    desDataList.value.insert(
        2,
        CBTCommonModel(
            id: "3",
            title: "Online Test",
            image: AppImages.simulation,
            originalModel: ""));

    desDataList.value.insert(
        3,
        CBTCommonModel(
            id: "4",
            title: "Test Generator",
            image: AppImages.figma,
            originalModel: ""));

    await getRestApi();
  }

  Future<void> getRestApi() async {
    isLoading.value = true;
    var token = await prefHandler.getUserToken();
    OnLineLearnRepo().getCBData(
      // data: {
      //   // "PR_TOKEN": "ae91defc-dd3a-498d-ab26-001efe0ee3e9",
      //   "PR_CATEGORY_ID": 1,
      //   "PR_BOOK_ID": 106
      //   // "PR_BOOK_ID": 1
      // },
      // // urlStr: "http://deepuprakashan.com/school-api/book-with-all-data",
      // urlStr: "http://deepuprakashan.com/school-api/book-with-all-data",

      data: {
        "PR_TOKEN": token,
        "PR_CATEGORY_ID": cbtCommonModel!.originalModel.prCategory.prCategoryId,
        // "PR_BOOK_ID":2
        "PR_BOOK_ID": cbtCommonModel!.id
        // "PR_BOOK_ID": 1
      },

      urlStr: ApiUrls.cbtBaseUrl("mobile-api/book-with-all-data"),
      // // urlStr: ApiUrls.cbtBaseUrl("school-api/book-with-all-data"),
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          vcbTechModel.value = posts.resObject!;

          isLoading.value = false;
        }

        isLoading.value = false;
        update();
      },
      onError: (error) {
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    // isLoading.value = false;
  }

  // void onUpdateListClick(int index, {required bool isView}) async {
  //   desDataList.forEach((element) {
  //     element.selected = false;
  //   });
  //   desDataList[index].selected = true;
  //   isSelectedPosition.value = index;
  //   isAdd.value = true;
  //   this.isView.value = isView == true && this.isView.value ? true : false;
  //
  //   // if (isSelectedPosition.value != 10000) {
  //   CbtPlayerType data = CbtPlayerType.CBT_SIMULATION;
  //   if (desDataList.value[isSelectedPosition.value].id == "1") {
  //     data = CbtPlayerType.CBT_VIDEO;
  //     if (vcbTechModel.value!.data!.prVideoData!.isNotEmpty) {
  //       if (GetPlatform.isWeb) {
  //         Get.to(() => YoutubeViewer(
  //               vcbTechModel: vcbTechModel.value!,
  //             ));
  //       } else {
  //         Get.to(
  //             () => TopicView(cbtCommonModel!, data,
  //                 isTable: false, vcbTechModel: vcbTechModel.value),
  //             binding: StudentBinding());
  //       }
  //     } else {
  //       errorMessage("Please add Video from Admin");
  //     }
  //   } else if (desDataList.value[isSelectedPosition.value].id == "2") {
  //     data = CbtPlayerType.CBT_PDF;
  //
  //     List<PrFlashCardDatum> prFlashCardData = List.empty(growable: true);
  //
  //     vcbTechModel.value!.data!.prFlashCard!.forEach((element) {
  //       prFlashCardData.add(PrFlashCardDatum(
  //           prBook: 0,
  //           prCategory: 0,
  //           // prCreatedAt: null,
  //           prFlashCardId: element['PR_FLASH_CARD_ID'],
  //           prImgPath: element['PR_IMG_PATH']));
  //     });
  //
  //     // Get.put(FlashController());
  //
  //     if (prFlashCardData.isNotEmpty) {
  //       Get.to(FlashPage(
  //         flashCardsList: prFlashCardData,
  //         title: vcbTechModel.value!.data!.prName!,
  //       ));
  //     } else {
  //       errorMessage("Please add Ebook from Admin");
  //     }
  //
  //     // var pdfUrl = await getPDFData(cbtCommonModel!.id, mContext!);
  //   } else if (desDataList.value[isSelectedPosition.value].id == "3") {
  //     // data = CbtPlayerType.CBT_SIMULATION;
  //     // Get.to(CbtFillActivity(
  //     //   title: "Demo",
  //     //   vcbTechModel: vcbTechModel.value!,
  //     //   id: 4,
  //     //   code: "",
  //     //   chapterId: 1,
  //     // ));
  //
  //     loadPaperByBookQuestion(vcbTechModel.value!.data!.prBookId!);
  //
  //     // Get.to(ExamDetailsPage(item: ));
  //   } else if (desDataList.value[isSelectedPosition.value].id == "4") {
  //     data = CbtPlayerType.CBT_SIMULATION;
  //     if (vcbTechModel.value!.data!.prTestGeneratorData!.isNotEmpty) {
  //       if (vcbTechModel.value!.data!.prSubject!.prName!
  //           .toLowerCase()
  //           .contains("hindi")) {
  //         Get.put(OnlineTgController());
  //         Get.to(OnLineTgView(
  //           cbttgLanguage: CBTTGLanguage.CBT_HINDI,
  //           bookId: vcbTechModel.value!.data!.prBookId!.toString(),
  //           categoryID:
  //               vcbTechModel.value!.data!.prCategory!.prCategoryId!.toString(),
  //           prTestGeneratorData:vcbTechModel.value!.data!.prTestGeneratorData!,
  //         ));
  //       } else {
  //         Get.put(OnlineTgController());
  //         Get.to(OnLineTgView(
  //           cbttgLanguage: CBTTGLanguage.CBTENGLISH,
  //           bookId: vcbTechModel.value!.data!.prBookId!.toString(),
  //           categoryID:
  //               vcbTechModel.value!.data!.prCategory!.prCategoryId!.toString(),
  //           prTestGeneratorData:vcbTechModel.value!.data!.prTestGeneratorData!,
  //         ));
  //       }
  //     } else {
  //       errorMessage("Please add TG from Admin");
  //     }
  //   } /*else {
  //     Get.back();
  //   }*/
  // }

  void onUpdateListClick(int index, {required bool isView}) async {
    desDataList.forEach((element) {
      element.selected = false;
    });
    desDataList[index].selected = true;
    isSelectedPosition.value = index;
    isAdd.value = true;
    this.isView.value = isView == true && this.isView.value ? true : false;

    // if (isSelectedPosition.value != 10000) {
    CbtPlayerType data = CbtPlayerType.CBT_SIMULATION;
    if (desDataList.value[isSelectedPosition.value].id == "1") {
      data = CbtPlayerType.CBT_VIDEO;

      if (vcbTechModel.value!.data!.prVideoData!.isNotEmpty) {
        if (vcbTechModel
            .value!.data!.prVideoData!.first.prVideo!.prVideoUrl!.isNotEmpty) {
          if (GetPlatform.isWeb) {
            Get.to(() => YoutubeViewer(
                  vcbTechModel: vcbTechModel.value!,
                ));
          } else {
            Get.to(
                () => TopicView(cbtCommonModel!, data,
                    isTable: false, vcbTechModel: vcbTechModel.value),
                binding: StudentBinding());
          }
        } else {
          Get.snackbar(
            "Alert",
            "Please Upload Data from Admin",
            colorText: Colors.white,
            backgroundColor: Colors.redAccent,
            icon: const Icon(Icons.add_alert),
          );
        }
      } else {
        Get.snackbar(
          "Alert",
          "Please Upload Data from Admin",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          icon: const Icon(Icons.add_alert),
        );
      }
    } else if (desDataList.value[isSelectedPosition.value].id == "2") {
      data = CbtPlayerType.CBT_PDF;

      List<PrFlashCardDatum> prFlashCardData = List.empty(growable: true);

      vcbTechModel.value!.data!.prFlashCard!.forEach((element) {
        prFlashCardData.add(PrFlashCardDatum(
            prBook: 0,
            prCategory: 0,
            // prCreatedAt: null,
            prFlashCardId: element['PR_FLASH_CARD_ID'],
            prImgPath: element['PR_IMG_PATH']));
      });

      // Get.put(FlashController());

      if (prFlashCardData.isNotEmpty) {
        Get.to(FlashPage(
          flashCardsList: prFlashCardData,
          title: vcbTechModel.value!.data!.prName!,
        ));
      } else {
        Get.snackbar(
          "Alert",
          "Please Upload Data from Admin",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          icon: const Icon(Icons.add_alert),
        );
      }

      // if (vcbTechModel.value!.data!.prFlashCard!.isNotEmpty) {
      //   List<PrFlashCardDatum> prFlashCardData = List.empty(growable: true);
      //
      //   vcbTechModel.value!.data!.prFlashCard!.forEach((element) {
      //     prFlashCardData.add(PrFlashCardDatum(
      //         prBook: 0,
      //         prCategory: 0,
      //         prCreatedAt: null,
      //         prFlashCardId: 0,
      //         prImgPath: element.prImgPath));
      //   });
      //
      //   // Get.put(FlashController());
      //
      //   Get.to(FlashPage(
      //     flashCardsList: prFlashCardData,
      //     title: vcbTechModel.value!.data!.prName!,
      //   ));
      // } else {
      //   Get.snackbar(
      //     "Alert",
      //     "Please Upload Data from Admin",
      //     colorText: Colors.white,
      //     backgroundColor: Colors.redAccent,
      //     icon: const Icon(Icons.add_alert),
      //   );
      // }

      // var pdfUrl = await getPDFData(cbtCommonModel!.id, mContext!);
    } else if (desDataList.value[isSelectedPosition.value].id == "3") {
      // data = CbtPlayerType.CBT_SIMULATION;
      // Get.to(CbtFillActivity(
      //   title: vcbTechModel.value!.data!.prName!,
      //   vcbTechModel: vcbTechModel.value!,
      //   id: 2,
      //   code: "",
      //   chapterId: 1,
      // ));
      // if (vcbTechModel.value!.data!.activityDataList!.isNotEmpty) {
      //   Get.to(ChapterActivity(
      //     title: vcbTechModel.value!.data!.prName!,
      //     vcbTechModel: vcbTechModel.value!,
      //   ));}else{
      //   Get.snackbar(
      //     "Alert",
      //     "Please Upload Data from Admin",
      //     colorText: Colors.white,
      //     backgroundColor: Colors.redAccent,
      //     icon: const Icon(Icons.add_alert),
      //   );
      // }
      loadPaperByBookQuestion(vcbTechModel.value!.data!.prBookId!);
    } else if (desDataList.value[isSelectedPosition.value].id == "4") {
      data = CbtPlayerType.CBT_SIMULATION;

      if (vcbTechModel.value!.data!.prTestGeneratorData!.isNotEmpty) {
        Get.put(OnlineTgController());
        Get.to(OnLineTgView(
          cbttgLanguage: CBTTGLanguage.CBTENGLISH,
          bookId: vcbTechModel.value!.data!.prBookId!.toString(),
          categoryID:
              vcbTechModel.value!.data!.prCategory!.prCategoryId!.toString(),
          prTestGeneratorData: vcbTechModel.value!.data!.prTestGeneratorData!,
        ));
      } else {
        Get.snackbar(
          "Alert",
          "Please Upload Data from Admin",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          icon: const Icon(Icons.add_alert),
        );
      }
    } /*else {
      Get.back();
    }*/
  }

  errorMessage(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Alert",
      message: message,
      cancelText: "",
      confirmText: "",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
      },
    );
  }

  void onChangeTitle(String val) {
    title.value = val;
  }

  final RxList<ExamQuestionList> examList = <ExamQuestionList>[].obs;

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
          Get.to(() => ExamPage(title: examList.value.first.prBook!.prName!,examList:examList.value));
        } else {
          Get.snackbar(
            "Alert",
            "Please Upload Data from Admin",
            colorText: Colors.white,
            backgroundColor: Colors.redAccent,
            icon: const Icon(Icons.add_alert),
          );
          examList.value = [];
          examList.value = [];
        }
        isLoading.value = false;
      },
      onError: (error) {
        examList.value.clear();
        examList.value.clear();
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    // isLoading.value = false;
  }
}
