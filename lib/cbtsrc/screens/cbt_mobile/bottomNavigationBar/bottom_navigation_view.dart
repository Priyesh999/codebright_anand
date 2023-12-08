import 'package:digigyan/cbtsrc/cbt_helpers/style/app_color.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/bottomNavigationBar/bottomNavigationBody.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/bottomNavigationBar/bottom_navigation_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cbt_helpers/customnavigationbar/curved_navigation_bar.dart';

class BottomView extends GetView<BottomController> {
  RxList<CbtTabData> _title = <CbtTabData>[].obs;

  @override
  Widget build(BuildContext context) {
    _initdata();

    controller.navigateToView();
    return Scaffold(
      backgroundColor: AppColor.white,
      // body: CurvedNavigationBar(items: _title.value, index: 0),
      body: BottomNavigationMain(activeIndex:0,cartItem:  "", isLoading: false),
    );
  }


  void _initdata() {
    _title.value = [
      CbtTabData(
          name: "Home",
          icon: const Icon(
            CupertinoIcons.house,
            color: Colors.grey,
          ),
          iconSelected: const Icon(
            CupertinoIcons.house_fill,
            color: CodebrightColor.cbtPrimarColor,
          ),
          isSelected: true),
      CbtTabData(
          name: "Watchlist",
          icon: const Icon(
            CupertinoIcons.square_favorites_alt,
            color: Colors.grey,
          ),
          iconSelected: const Icon(
            CupertinoIcons.square_favorites_alt_fill,
            color: CodebrightColor.cbtPrimarColor,
          ),
          isSelected: false),
      CbtTabData(
          name: "Profile",
          icon: const Icon(
            CupertinoIcons.person_crop_square,
            color: Colors.grey,
          ),
          iconSelected: const Icon(
            CupertinoIcons.person_crop_square_fill,
            color: CodebrightColor.cbtPrimarColor,
          ),
          isSelected: false),
      CbtTabData(
          name: "Test",
          icon: const Icon(
            CupertinoIcons.t_bubble,
            color: Colors.grey,
          ),
          iconSelected: const Icon(
            CupertinoIcons.t_bubble_fill,
            color: CodebrightColor.cbtPrimarColor,
          ),
          isSelected: false),
    ];
  }
}
