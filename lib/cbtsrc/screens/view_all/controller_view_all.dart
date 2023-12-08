import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/constants/app_config.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/recent_model.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/repo_watchlist.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/watch_list_model.dart';
import 'package:get/get.dart';

class ViewAllController extends GetxController {
  final RxInt isSelectedPosition = (-1).obs;
  final RxBool isLoading = false.obs;

  final RxList<PrVodeoDatum> videoList = <PrVodeoDatum>[].obs;
  final RxList<PrPdfDatum> pdfList = <PrPdfDatum>[].obs;

  @override
  void onReady() async {}

  void openMenu(WatchListModel phMenu) async {}

  Future<void> setUserDetails() async {
    await loadRecent();
  }

  Future<void> loadRecent({bool isGoBack = false}) async {
    isLoading.value = true;
    // var classId = await prefHandler.getClassId();
    var token = await prefHandler.getUserToken();
    CbtLFProvider().getPostsListByUrlRecent(
      data: {"PR_APP_VERSION": AppConfigs().apiVersion, "PR_TOKEN": token},
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

  @override
  void onInit() {
    videoList.value.clear();
    pdfList.value.clear();
    setUserDetails();
    super.onInit();
  }
}
