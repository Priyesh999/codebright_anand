import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbt_loader.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_mobile_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/home_view.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/page_watchlist.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../cbt_model/menu_model.dart';
import '../../scanned_data/scanned_view.dart';
import 'appDrawer/appBar.dart';
import 'appDrawer/appDrawer.dart';

class BottomNavigationMain extends StatefulWidget {
  int activeIndex = 0;
  String cartItem = "0";
  bool isLoading = false;

  BottomNavigationMain(
      {this.activeIndex = 0, this.cartItem = "0", this.isLoading = false});

  @override
  _BottomNavigationMainState createState() => _BottomNavigationMainState();
}

class _BottomNavigationMainState extends State<BottomNavigationMain>
    with SingleTickerProviderStateMixin {
  var _tabs = List.empty();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  RxList<CbtTabData> _title = <CbtTabData>[].obs;
  RxInt isSelectedPos = 0.obs;
  String appMenuTitle = "CB";
  List<Widget> _titleIcons = List.empty(growable: true);
  AnimationController? _animationController;

  @override
  void initState() {
    getData();
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  // getUserDetail() async {
  //   userName = (await PreferenceHandler().getUserName())!;
  //   email = (await PreferenceHandler().getEmail())!;
  //   phone=(await PreferenceHandler().getMobile())!;
  //

  _toggleAnimation() {
    _animationController!.isDismissed
        ? _animationController!.forward()
        : _animationController!.reverse();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
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
    _tabs = [
      HomeView(),
      WatchListPage(),
      CbtLFMobileView(MenuModel()),
      ScannedPage(),
      // FlashNewsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    getData();
    _initdata();
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        double slide = rightSlide * _animationController!.value;
        double scale = 1 - (_animationController!.value * 0.3);
        return Stack(
          children: [
            Scaffold(
              backgroundColor: CodebrightColor.cbtPrimarColor.withOpacity(0.8),
              body: CustomDrawer(),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(GetPlatform.isWeb ? 0 : slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: SizedBox(
                  height: 50,
                  child: Card(
                    color: Colors.deepPurple.shade50,
                    // child: GridView.count(
                    //     crossAxisCount: _title.value.length,
                    //     children: List<Widget>.generate(_title.value.length, (index) {
                    //       return GridTile(
                    //         child: Obx(()=>_title.value[index].isSelected
                    //             ? Card(
                    //                 color: Colors.purple.shade100,
                    //                 child: Column(
                    //                   children: [
                    //                     IconButton(
                    //                         onPressed: () {},
                    //                         icon: _title.value[index].icon),
                    //                     CBTTextNew(
                    //                       _title.value[index].name,
                    //                       style: TStyle.f7_R
                    //                           .styleWith(color: Colors.black),
                    //                     ),
                    //                   ],
                    //                 ))
                    //             : Column(
                    //                 children: [
                    //                   IconButton(
                    //                       onPressed: () {
                    //                         _title.value.forEach((element) {
                    //                           element.isSelected = false;
                    //                         });
                    //                         _title.value[index].isSelected = true;
                    //                         // setState(() {});
                    //                       },
                    //                       icon: _title.value[index].icon),
                    //                   // CBTTextNew(_title[index],style: TStyle.f8_M.style,),
                    //                 ],
                    //               ),
                    //       ));
                    //     })),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _title.value.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int childIndex) {
                        final phMenu = this._title.value[childIndex];
                        return GestureDetector(
                          onTap: () {},
                          child: Obx(
                            () => isSelectedPos.value == childIndex
                                ? Focus(
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: _title.value[childIndex]
                                                .iconSelected),
                                        // CBTTextNew(
                                        //   _title.value[childIndex].name,
                                        //   style: TStyle.f7_R.styleWith(
                                        //       color: Colors.black),
                                        // ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            _title.value.forEach((element) {
                                              _title.value[childIndex]
                                                  .isSelected = false;
                                            });
                                            isSelectedPos.value = childIndex;
                                            _title.value[isSelectedPos.value]
                                                .isSelected = true;
                                            widget.activeIndex = childIndex;
                                          },
                                          icon: _title.value[childIndex].icon),

                                      // CBTTextNew(_title[index],style: TStyle.f8_M.style,),
                                    ],
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: CustomAppBar(
                    appBarName: getTitleData(),
                    onPressed: () {
                      _toggleAnimation();
                      // _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
                body: Stack(
                  children: [
                    _tabs[widget.activeIndex],
                    widget.isLoading ? CBTLoaderProgress() : SizedBox.shrink(),
                    // isLoading ? Center(child: CupertinoActivityIndicator()) : SizedBox.shrink(),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  String titleMenu = "CB";

  Future<String> getData() async {
    String? appMenuTitle = await prefHandler.getUserName();
    titleMenu = await (appMenuTitle!.split(" ").length == 2
        ? appMenuTitle.split(" ")[0].substring(0, 1) +
            appMenuTitle.split(" ")[1].substring(0, 1)
        : appMenuTitle.split(" ")[0].substring(0, 1));

    setState(() {});
    return titleMenu;
  }

  String getTitleData() {
    return titleMenu;
  }
}

class CbtTabData {
  String name = "";
  Icon icon;
  Icon iconSelected;
  bool isSelected;

  CbtTabData(
      {this.name = "",
      this.icon = const Icon(CupertinoIcons.rectangle_grid_2x2_fill),
      this.iconSelected = const Icon(CupertinoIcons.rectangle_grid_2x2_fill),
      this.isSelected = false});
}
