import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';

@immutable
class CbtAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  String title;
  String? subTitle;
  List<Widget> actionButtons;
  PreferredSizeWidget? bottom;
  bool visible;

  CbtAppBar({
    required this.title,
    this.subTitle,
    this.bottom,
    this.actionButtons = const <Widget>[],
    this.visible = true,
    Key? key,
  })  : preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize.height ?? 0),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return AppBar(toolbarHeight: 0);
    }
    return AppBar(
      bottom: bottom,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      leadingWidth: kToolbarHeight - 10,
      elevation: 3,
      backgroundColor: Colors.white,
      // flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //             begin: Alignment.topCenter, end: Alignment.bottomCenter,
      //             colors: <Color>[primaryColor, cyanColor]))),
      title: subTitle == null
          ? CBTTextNew(
              title,
              style: TStyle.f16_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CBTTextNew(
                  title,
                  style: TStyle.f16_B
                      .styleWith(fontFamily: AppFontsNeo.leagueBold),
                ),
                CBTTextNew(
                  title,
                  style: TStyle.f10_B
                      .styleWith(fontFamily: AppFontsNeo.leagueBold),
                )
              ],
            ),
      actions: actionButtons,
    );
  }
}

@immutable
class CbtAppBarB extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  String title;
  Widget? subTitle;
  List<Widget> actionButtons;
  PreferredSizeWidget? bottom;
  bool visible;

  CbtAppBarB({
    required this.title,
    this.subTitle,
    this.bottom,
    this.actionButtons = const <Widget>[],
    this.visible = true,
    Key? key,
  })  : preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize.height ?? 0),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return AppBar(toolbarHeight: 0);
    }
    return AppBar(
      bottom: bottom,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      leadingWidth: kToolbarHeight - 10,
      elevation: 3,
      backgroundColor: Colors.white,
      title:
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CBTTextNew(
            title,
            style: TStyle.f14_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
          ),
          subTitle!
        ],
      ),
      actions: actionButtons,
    );
  }
}



@immutable
class CbtAppBarCBT extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  Widget title;
  Widget? subTitle;
  List<Widget> actionButtons;
  PreferredSizeWidget? bottom;
  bool visible;

  CbtAppBarCBT({
    required this.title,
    this.subTitle,
    this.bottom,
    this.actionButtons = const <Widget>[],
    this.visible = true,
    Key? key,
  })  : preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize.height ?? 0),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return AppBar(toolbarHeight: 0);
    }
    return AppBar(
      bottom: bottom,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      leadingWidth: kToolbarHeight - 10,
      elevation: 3,
      backgroundColor: Colors.white,
      title:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title,
          // subTitle!
        ],
      ),
      actions: actionButtons,
    );
  }
}
