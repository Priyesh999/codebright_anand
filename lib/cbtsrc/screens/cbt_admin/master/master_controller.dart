import 'dart:io';
import 'dart:typed_data';

import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/app_config.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_repo.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/sub_master_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RxNullable<T> {
  Rx<T> setNull() => (null as T).obs;
}

class MasterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // final MasterRepository repository = Get.put(MasterRepository());

  // TabController? tabController;
  //
  final Rx<TabController?> _tabController =
      RxNullable<TabController?>().setNull();

  TabController? get tabController => _tabController.value;

  set tabController(TabController? tab) => _tabController.value = tab;

  final RxBool isLoading = true.obs;
  final RxInt isSelectedPosition = 0.obs;

  // final RxList<MenuModel?> _menuList = <MenuModel>[].obs;

  final RxList<MenuModel?> menuList = <MenuModel>[].obs;

  // List<MenuModel?> get menuList => _menuList;
  //
  // set menuList(List<MenuModel?> menuList) => _menuList.value = menuList;

  // final RxList<Widget> _viewList = <Widget>[].obs;
  //
  // List<Widget> get viewList => _viewList;
  //
  // set viewList(List<Widget> tabViewList) => _viewList.value = tabViewList;

  // final RxList<Tab> _tabList = <Tab>[].obs;
  //
  // List<Tab> get tabList => _tabList;
  //
  // set tabList(List<Tab> tabList) => _tabList.value = tabList;
  //
  final RxInt _tabIndex = 0.obs;

  //
  int get tabIndex => _tabIndex.value;

  final TextEditingController textEditingController = TextEditingController();

  final RxBool _isSearching = false.obs;

  bool get isSearching => _isSearching.value;

  set isSearching(bool value) => _isSearching.value = value;

  final RxBool _isGlobalMangaSearching = false.obs;

  bool get isGlobalMangaSearching => _isGlobalMangaSearching.value;

  set isGlobalMangaSearching(bool value) =>
      _isGlobalMangaSearching.value = value;


  @override
  void onInit() async {
    menuList.value = await prefHandler.getMenuData();

    await loadMenu();
    var menuData = await prefHandler.getMenuData();
    if (menuData.isEmpty) {
      isLoading.value = true;
      await loadMenu();
    } else {
      isLoading.value = false;
    }

    // tabController =
    //     TabController(length: menuList.length, vsync: this, initialIndex: 0);
    // tabController!.addListener(() => _tabIndex.value = tabController!.index);
    await setMenuList();

    super.onInit();
  }

  Future<void> setMenuList() async {
    menuList.value = await prefHandler.getMenuData();
    menuList.value[isSelectedPosition.value]!.isSelected = true;
    // viewList.clear();
    // tabList.clear();
    // menuList.forEach((element) async {
    //   tabList.add(Tab(text: element!.prMenuName!.tr));
    //   if (element.prMenuCode == MenuCode.masterCode) {
    //     viewList.add(SubMasterView(element));
    //   } else if (element.prMenuCode == MenuCode.cbtOrginationCode) {
    //     viewList.add(InventoryView(element));
    //   } else if (element.prMenuCode == MenuCode.importCode) {
    //     viewList.add(CbtWebView(
    //       url: "http://demo.codebright.in/form/import-excel-list/1",
    //     ));
    //   } else if (element.prMenuCode == MenuCode.transactionCode) {
    //     viewList.add(TransactionMasterView(element));
    //   } else if (element.prMenuCode == MenuCode.questionBank) {
    //     // viewList.add(DwrMasterView(element));
    //   } else if (element.prMenuCode == MenuCode.utilityCode) {
    //     viewList.add(UtilityView(element));
    //   } else if (element.prMenuCode == MenuCode.otherCode) {
    //     viewList.add(OtherView(element));
    //   } else if (element.prMenuCode == MenuCode.customerCode) {
    //     viewList.add(CustomerView(element));
    //   } else if (element.prMenuCode == MenuCode.settingCode) {
    //     viewList.add(SettingView(element));
    //   } else if (element.prMenuCode == MenuCode.recurtmentCode) {
    //     viewList.add(RecurtmentView(element));
    //   } else if (element.prMenuCode == MenuCode.documentCode) {
    //     viewList.add(DocumentView(element));
    //   } else if (element.prMenuCode == MenuCode.promotionCode) {
    //     // viewList.add(VideoView());
    //   } else if (element.prMenuCode == MenuCode.accountCode) {
    //     viewList.add(AccountView(element));
    //   } else if (element.prMenuCode == MenuCode.supportCode) {
    //     viewList.add(SupportView(element));
    //   } else {
    //     viewList.add(SubMasterView(element));
    //   }
    // });
  }

  Future<void> loadMenu() async {
    isLoading.value = true;
    var userId = await prefHandler.getUserId();
    var companyID = await prefHandler.getCompanyID();

    HomeAdminProvider().getMenuList(
      requestData: {
        "PR_APP_VERSION": AppConfigs().apiVersion,
        "PR_USER_ID": userId.toString(),
      },
      // },
      onSuccess: (posts) async {
        if (posts.isSuccess) {
          await prefHandler.setMenuData(posts.resObject!);
          menuList.value = await prefHandler.getMenuData();
        }

        isLoading.value = false;
        update();
      },
      onError: (error) {
        isLoading.value = false;
        update();
      },
      beforeSend: () {},
    );
    isLoading.value = false;
  }

  Future<void> clickItem(int index) async {
    isSelectedPosition.value = index;

    SubMasterController subMasterController = Get.put(SubMasterController());
    subMasterController.isSelectedPosition.value = 0;

    menuList.value.forEach((element) {
      if (menuList.value[isSelectedPosition.value]!.prMenuCode ==
          element!.prMenuCode) {
        element.isSelected = true;
        element.prSubmenues!.forEach((element) {
          element.isSelected = false;
        });
        element.prSubmenues![0].isSelected = true;
      } else {
        element.isSelected = false;
      }
    });
  }
}
