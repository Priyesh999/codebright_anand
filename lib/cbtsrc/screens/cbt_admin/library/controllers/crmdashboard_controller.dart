import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/enums/manga/manga_filter.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/enums/manga/manga_sort.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CrmDashBoardController extends GetxController
    with GetTickerProviderStateMixin {
  final TextEditingController textEditingController = TextEditingController();
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  final RxMap<MangaFilter, bool?> _mangaFilter = <MangaFilter, bool?>{
    for (var element in MangaFilter.values) element: null
  }.obs;

  Map<MangaFilter, bool?> get mangaFilter => _mangaFilter;

  set mangaFilter(Map<MangaFilter, bool?> value) => _mangaFilter.value = value;

  final Rx<MapEntry<MangaSort, bool>> _mangaSort =
      MapEntry(MangaSort.id, true).obs;

  MapEntry<MangaSort, bool> get mangaSort => _mangaSort.value;

  set mangaSort(MapEntry<MangaSort, bool> value) => _mangaSort.value = value;

  final RxBool _isSearching = false.obs;

  bool get isSearching => _isSearching.value;

  set isSearching(bool value) => _isSearching.value = value;

  final RxBool _isLoading = false.obs;
  final RxString userId = "".obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) => _isLoading.value = value;

  final RxBool _isCategoryLoading = false.obs;

  bool get isCategoryLoading => _isCategoryLoading.value;

  set isCategoryLoading(bool value) => _isCategoryLoading.value = value;


  // final RxList<Manga> _mangaList = <Manga>[].obs;
  // List<Manga> get mangaList => _mangaList;
  // set mangaList(List<Manga> mangaList) => _mangaList.value = mangaList;
  // int get mangaListLength => _mangaList.length;


  Future<void> loadCategoryList() async {
  }

  Future<void> loadMangaListWithCategoryId() async {
    isLoading = true;
    applyFilter();
    isLoading = false;
  }

  void applyFilter() {
  }

  Future<void> refreshLibraryScreen() async {
    await loadCategoryList();
    await loadMangaListWithCategoryId();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {

    Get.find<HomeAdminController>().selectedIndexObs.listen((value) async {
      if (value.isEqual(0)) {
        tabController.animateTo(0);
        await refreshLibraryScreen();
      }
    });
    super.onReady();
  }

  void setUserData()async {
    var userID = await prefHandler.getUserId();
    userId.value = userID!;
    // userId.value=await prefHandler.getUserId().toString();
  }
}
