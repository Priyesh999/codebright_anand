import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/flash_card_list/flash_card_list_model.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/repo_flash.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/watch_list_model.dart';
import 'package:get/get.dart';

import '../page_flas.dart';

class FlashCardGridController extends GetxController {
  final RxInt isSelectedPosition = (-1).obs;
  final RxList<FlashCardGridModel> flashCardList = <FlashCardGridModel>[].obs;
  final RxList<FlashCardGridModel> flashCardListCopy =
      <FlashCardGridModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onReady() async {}

  void openMenu(WatchListModel phMenu) async {
    // Get.to(() => DesignationLFView(phMenu), binding: DesignationLFBinding());
  }

  Future<void> loadSubject({bool isGoBack = false}) async {
    isLoading.value = true;
    var userId = await prefHandler.getUserId();
    flashCardList.clear();
    flashCardListCopy.clear();
    FlashNewsRepo().getFlashCardGrid(
      data: {
        /*"PR_BOOK_ID": "359"*/
      },
      urlStr: "flash-grid",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          flashCardList.value = posts.resObject!;
          flashCardListCopy.value = posts.resObject!;
        } else {
          flashCardList.value = [];
        }
        if (isGoBack) {
          Get.back();
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        flashCardList.clear();
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    // isLoading.value = false;
  }

  Future<void> loadSubjectClick(
      {bool isGoBack = false, String bookID = ""}) async {
    isLoading.value = true;
    var userId = await prefHandler.getUserId();
    flashCardList.clear();
    flashCardListCopy.clear();
    FlashNewsRepo().getFlashCardGrid(
      data: {"PR_BOOK_ID": bookID},
      urlStr: "flash-grid",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          // flashCardList.value = posts.resObject!;
          // flashCardListCopy.value = posts.resObject!;
          Get.to(FlashPage(
                  flashCardsList: posts.resObject!.first.prFlashCardData!))!
              .then((value) => {loadSubject()});
        } else {
          flashCardList.value = [];
        }
        if (isGoBack) {
          Get.back();
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        flashCardList.clear();
        isLoading.value = false;
      },
      beforeSend: () {},
    );
    // isLoading.value = false;
  }

  Future<void> setUserDetails() async {
    await loadSubject();
  }

  @override
  void onInit() {
    flashCardList.clear();
    setUserDetails();
    super.onInit();
  }
}
