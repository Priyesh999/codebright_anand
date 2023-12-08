import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SubMasterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // final MasterRepository repository = Get.put(MasterRepository());

  // TabController? tabController;

  // final Rx<TabController?> _tabController =
  //     RxNullable<TabController?>().setNull();
  //
  // TabController? get tabController => _tabController.value;
  //
  // set tabController(TabController? tab) => _tabController.value = tab;

  final RxInt isSelectedPosition = 0.obs;


  final RxInt _tabIndex = 0.obs;
  RxBool isLoading = false.obs;

  int get tabIndex => _tabIndex.value;

  final TextEditingController textEditingController = TextEditingController();

  final RxBool _isSearching = false.obs;

  bool get isSearching => _isSearching.value;

  set isSearching(bool value) => _isSearching.value = value;

  final RxBool _isGlobalMangaSearching = false.obs;

  bool get isGlobalMangaSearching => _isGlobalMangaSearching.value;

  set isGlobalMangaSearching(bool value) =>
      _isGlobalMangaSearching.value = value;

  // final RxList<Widget> _viewList = <Widget>[].obs;
  //
  // List<Widget> get viewList => _viewList;
  //
  // set viewList(List<Widget> tabViewList) => _viewList.value = viewList;
  //
  // final RxList<Tab> _tabList = <Tab>[].obs;
  //
  // List<Tab> get tabList => _tabList;
  //
  // set tabList(List<Tab> tabList) => _tabList.value = tabList;

  Rx<MenuModel?> menu = RxNullable<MenuModel?>().setNull();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    List<MenuModel> menuList = await prefHandler.getMenuData();
    MenuModel m = MenuModel();
    for (var element in menuList) {
      if (element.prMenuCode == MenuCode.masterCode) {
        m = element;
      }
    }
    await setMenuList(m);
    // tabController = TabController(
    //     length: m.prSubmenues!.length, vsync: this, initialIndex: 0);
    //
    // tabController!.addListener(() {
    //   _tabIndex.value = tabController!.index;
    // });
    // tabController!.addListener(() => _tabIndex.value = tabController!.index);
    super.onReady();
  }

  Future<void> setMenuList(MenuModel m) async {
    menu.value = m;
    // viewList.clear();
    // tabList.clear();
    // for (var element in m.prSubmenues!) {
    //   if (element.prMenuCode == "CBT_PAPER_GENERATOR" ||
    //       element.prMenuCode == "CBT_IMPORT") {
    //     viewList.add(CbtWebView(
    //         url: CBTUrlByMenu.getUrlByMenu(
    //             menu: element, formId: "", employeeId: "")));
    //   } else {
    //     viewList.add(CbtLFView(element));
    //   }
    //   tabList.add(Tab(text: (element).prMenuName!.tr));
    // }
  }

  Future<void> clickItem(int index) async {
    isSelectedPosition.value = index;
    menu.value!.prSubmenues!.forEach((element) {
      if (menu.value!.prSubmenues![isSelectedPosition.value].prMenuCode ==
          element.prMenuCode) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    });
  }
}
