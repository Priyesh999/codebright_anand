import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/bottomNavigationBar/bottomNavigationBody.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/home_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_webview/cbt_webview.dart';
import 'package:digigyan/cbtsrc/screens/splash/splash_view.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../cbt_helpers/dailog/custom_alert_dialog.dart';
import '../../../cbt_admin/category_list/category_lf_form/company_form_view.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late Size size;
  String userName = "", email = "", phone = "";
  String titleMenu = "";

  HomeController? homeController;

  @override
  void initState() {
    homeController = Get.put(HomeController());
    getData();
    getUserDetail();
    super.initState();
  }

  getUserDetail() async {
    userName = (await prefHandler.getUserName())!;
    email = (await prefHandler.getEmail())!;
    phone = (await prefHandler.getMobile())!;
    setState(() {});
  }

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

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return lay();
  }

  Widget lay() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            userCard(),
            const SizedBox(height: 15),
            InkWell(
              onTap: () => {
                // if (homeController!.categoryID.value.isNotEmpty)
                //   {
                Get.to(CategoryView())!.then((value) => {
                      Get.to(BottomNavigationMain()),
                    }),
                //   }
                // else
                //   {
                //     CustomAlertDialog.showPresenceAlert(
                //       title: "Alert",
                //       message: "Please select caytegory first",
                //       onCancel: () => Get.back(),
                //       onConfirm: () async {
                //         Get.back();
                //         // Get.toNamed(Routes.HOME_ADMIN);
                //       },
                //     )
                //   }
              },
              child: Container(
                width: size.width - 120,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.category,
                      size: 25,
                      color: CodebrightColor.cbtPrimarColor,
                    ),
                    const SizedBox(width: 8),
                    CBTTextNew(
                      "Category",
                      style: TStyle.f14_B.styleWith(
                        color: CodebrightColor.cbtPrimarColor,
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () => {
                if (homeController!.categoryID.value.isNotEmpty)
                  {
                    Get.to(DepartmentLFView())!.then((value) => {
                          Get.to(BottomNavigationMain()),
                        }),
                  }
                else
                  {
                    CustomAlertDialog.showPresenceAlert(
                      title: "Alert",
                      message: "Please select caytegory first",
                      onCancel: () => Get.back(),
                      onConfirm: () async {
                        Get.back();
                        // Get.toNamed(Routes.HOME_ADMIN);
                      },
                    )
                  }
              },
              child: Container(
                width: size.width - 120,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.class_outlined,
                      size: 25,
                      color: CodebrightColor.cbtPrimarColor,
                    ),
                    const SizedBox(width: 8),
                    CBTTextNew("Class",
                        style: TStyle.f14_B.styleWith(
                          color: CodebrightColor.cbtPrimarColor,
                          fontFamily: AppFontsNeo.leagueBold,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.to(CbtWebView(
                        url: "https://studentadvisorbooks.in/privacy-policy/",
                        title: "Privacy Policy"))!
                    .then(
                  (value) => Get.to(BottomNavigationMain()),
                );
              },
              child: Container(
                width: size.width - 120,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.privacy_tip,
                      size: 25,
                      color: CodebrightColor.cbtPrimarColor,
                    ),
                    const SizedBox(width: 8),
                    CBTTextNew("Privacy Policy",
                        style: TStyle.f14_B.styleWith(
                          color: CodebrightColor.cbtPrimarColor,
                          fontFamily: AppFontsNeo.leagueBold,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.to(CbtWebView(
                        url: "https://studentadvisorbooks.in/terms-conditions/",
                        title: "Term & Condition"))!
                    .then(
                  (value) => Get.to(BottomNavigationMain()),
                );
              },
              child: Container(
                width: size.width - 120,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.terminal_rounded,
                      size: 25,
                      color: CodebrightColor.cbtPrimarColor,
                    ),
                    const SizedBox(width: 8),
                    CBTTextNew("Term & Condition",
                        style: TStyle.f14_B.styleWith(
                          color: CodebrightColor.cbtPrimarColor,
                          fontFamily: AppFontsNeo.leagueBold,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Container(
            //   width: size.width - 120,
            //   margin: const EdgeInsets.symmetric(horizontal: 10),
            //   padding: const EdgeInsets.all(12),
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.black12),
            //       borderRadius: BorderRadius.circular(8)),
            //   child: Row(
            //     children: [
            //       const Icon(
            //         Icons.support_agent,
            //         size: 25,
            //         color: materialPrimaryColor,
            //       ),
            //       const SizedBox(width: 8),
            //       CBTText(
            //         "Help & Support",
            //         mSize: 22,
            //         color: materialPrimaryColor,
            //       )
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 15),
            InkWell(
              onTap: () {
                CustomAlertDialog.showPresenceAlert(
                  title: "Logout!!",
                  message: "Are you sure to logout?",
                  onCancel: () => Get.back(),
                  onConfirm: () async {
                    prefHandler.logout();
                    Get.to(SplashView());
                    // Get.toNamed(Routes.HOME_ADMIN);
                  },
                );

                // locationBackground.onStop();
              },
              child: Container(
                width: size.width - 120,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      size: 25,
                      color: CodebrightColor.cbtPrimarColor,
                    ),
                    const SizedBox(width: 8),
                    CBTTextNew("Logout",
                        style: TStyle.f14_B.styleWith(
                          color: Colors.red,
                          fontFamily: AppFontsNeo.leagueBold,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget userCard() {
    return InkWell(
      onTap: () {
        // Get.to(DwrMasterView(), binding: DwrMasterBinding())!.then((value) => {
        //       Get.to(BottomNavigationMain()),
        //     });
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 1.5,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                CBTTextNew(userName,
                    style: TStyle.f16_B.styleWith(
                      color: CodebrightColor.cbtPrimarColor,
                      fontFamily: AppFontsNeo.leagueBold,
                    )),
                const SizedBox(height: 12),
                CBTTextNew("          $phone           ",
                    style: TStyle.f14_B.styleWith(
                      color: CodebrightColor.cbtPrimarColor,
                      fontFamily: AppFontsNeo.leagueBold,
                    )),
                const SizedBox(height: 10),
                Image.asset(
                  AppImages.userIcon,
                  height: 150,
                ),
                const SizedBox(height: 15),
                // Container(
                //   width: 80,
                //   height: 30,
                //   decoration: BoxDecoration(
                //       border: Border.all(color: materialAccentColor),
                //       borderRadius: BorderRadius.circular(18)),
                //   child: TextButton(
                //     onPressed: () {},
                //     child: DxTextGreen(
                //       "  Share  ",
                //       mBold: true,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Positioned(
              top: 1,
              left: 1,
              right: 1,
              child: Container(
                height: 55,
                width: 55,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CodebrightColor.cbtPrimarColor),
                child: CBTText(
                  titleMenu,
                  mBold: true,
                  mSize: 20,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }

  Widget tiles(
      {required String name,
      Function()? onTap,
      required String image,
      bool logout = false}) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: logout
              ? const Icon(
                  Icons.logout,
                  color: Colors.green,
                )
              : Image.asset(
                  image,
                  height: 35,
                  width: 35,
                ),
          title: CBTTextNew(
            name,
            mBold: true,
            mSize: 18,
          ),
        ),
        _getDivider()
      ],
    );
  }
}

Widget _getDivider({double lineHeight = 0.2}) => Container(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      height: lineHeight,
      width: double.infinity,
      color: Colors.black45,
    );
