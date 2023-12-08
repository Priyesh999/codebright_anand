import 'package:digigyan/cbtsrc/screens/scanned_data/scanned_model.dart';
import 'package:digigyan/cbtsrc/screens/scanned_data/scanned_repo.dart';
import 'package:get/get.dart';

import '../../cbt_data/cbt_db/cache/preference_handler.dart';
import '../../constants/ui_controls.dart';
import '../my_watch_list/watch_list_model.dart';

class ScannedController extends GetxController {
  final RxInt isSelectedPosition = (-1).obs;
  final RxList<ScannedModel> watchList = <ScannedModel>[].obs;
  final RxList<ScannedModel> watchListCopy = <ScannedModel>[].obs;
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
    ScannedRepo().getWatchList(
      data: {"PR_TOKEN": userId},
      urlStr: "mobile-api/scaned-data-list",
      codeType: SubMenuCode.bookCode,
      onSuccess: (posts) {
        if (posts.isSuccess) {
          watchList.value = posts.resObject!;
          watchList.value.forEach((element) {
            if (element.prVideo!.prName!.isNotEmpty) {
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
