import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/page_flash_news.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget {
  void Function() onPressed;
  String? cartItemCount;
  bool isText;
  String? appBarName;

  CustomAppBar(
      {required this.onPressed,
      this.cartItemCount = "0",
      this.isText = false,
      this.appBarName = "CB"});

  @override
  _TAppBarState createState() => _TAppBarState();
}

class _TAppBarState extends State<CustomAppBar> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      elevation: 2,
      leading: InkWell(
        onTap: widget.onPressed,
        child: Stack(
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: CodebrightColor.cbtPrimarColor),
              child: CBTTextNew(
                widget.appBarName!,
                mBold: true,
                style: TStyle.f14_B.styleWith(color: Colors.white),
              ),
            ),
            Positioned(
                right: 5,
                bottom: 4,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.menu,
                    color: CodebrightColor.cbtPrimarColor,
                    size: 12,
                  ),
                ))
          ],
        ),
      ),
      centerTitle: true,
      title: Image.asset(AppImages.cbtLogo, width: 200, height: 55),
      actions: [
        IconButton(
            onPressed: () {
              Get.to(() => FlashNewsPage());
            },
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ))
      ],
    );
  }
}
