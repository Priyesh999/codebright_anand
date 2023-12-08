import 'dart:math';

import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/repo_watchlist.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/watch_list_model.dart';
import 'package:get/get.dart';

class WatchListController extends GetxController {
  final RxInt isSelectedPosition = (-1).obs;
  final RxList<WatchListModel> watchList = <WatchListModel>[].obs;
  final RxList<WatchListModel> watchListCopy = <WatchListModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onReady() async {}

  void openMenu(WatchListModel phMenu) async {
    // Get.to(() => DesignationLFView(phMenu), binding: DesignationLFBinding());
  }

  Future<void> loadSubject({bool isGoBack = false}) async {
    isLoading.value = true;
    var userId = await prefHandler.getUserToken();
    watchList.clear();
    watchListCopy.clear();
    WatchListRepo().getWatchList(
      data: {"PR_TOKEN": userId},
      urlStr: "mobile-api/view-data-list",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          watchList.value = posts.resObject!;
          watchList.value.forEach((element) {
            if (element.prCategory!.prName!.isNotEmpty) {
              watchListCopy.value.add(element);
            }
          });
        } else {
          watchList.value = [];
        }
        if (isGoBack) {
          Get.back();
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
        watchList.clear();
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
    watchList.clear();
    setUserDetails();
    super.onInit();
  }
}
