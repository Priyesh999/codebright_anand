import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbt_loader.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/category_list/category_lf_form/company_form_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/online_learn/controller_online_learn.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearnPage extends StatelessWidget {
  String title;

  LearnPage({this.title = "Online Learn"});

  @override
  Widget build(BuildContext context) {
    Get.put(LearnController());
    return _LearnPageState(
      title: title,
    );
  }
}

class _LearnPageState extends GetView<LearnController> {
  String title;

  _LearnPageState({this.title = "Online Learn"});

  @override
  Widget build(BuildContext context) {
    controller.loadSubject();
    return Obx(() => Scaffold(
          appBar: CbtAppBar(
            title: title,
          ),
          body: Center(
            child: Container(
              child: Column(
                children: [
                  Visibility(
                    visible: true,
                    child: Row(
                      children: [
                        TextButton(
                            child: Card(
                              color: CodebrightColor.cbtPrimarColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CBTTextNew(
                                  controller.categoryName.value.isEmpty
                                      ? "Category"
                                      : controller.categoryName.value,
                                  style: TStyle.f10_B
                                      .styleWith(color: Colors.white),
                                ),
                              ),
                            ),
                            onPressed: () => {
                                  Get.to(CategoryView())!
                                      .then((value) async => {
                                            controller.subjectList.value
                                                .clear(),
                                            await controller.setUserDetails(),
                                            await controller.loadSubject(),
                                            // await controller.loadSubject(),
                                          }),
                                }),
                        Visibility(
                          visible: true,
                          child: TextButton(
                              child: Card(
                                color: CodebrightColor.cbtPrimarColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CBTTextNew(
                                    "Class " + controller.className.value,
                                    style: TStyle.f10_B
                                        .styleWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              onPressed: () => {
                                    Get.to(DepartmentLFView())!
                                        .then((value) async => {
                                              controller.subjectList.value
                                                  .clear(),
                                              await controller.setUserDetails(),
                                              await controller.loadSubject(),
                                              // await controller.loadSubject(),
                                            }),
                                  }),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: homeBody(controller.subjectList.value,
                        controller.bannerList.value, context),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget homeBody(List<DigiGyanModel?> homeData, List<String?> bannerResponse,
      BuildContext context) {
    return Container(
      child: GetPlatform.isWeb
          ? _web(homeData, bannerResponse, context)
          : _mobile(homeData, bannerResponse, context),
    );
  }

  Widget _web(List<DigiGyanModel?> homeData, List<String?> bannerResponse,
      BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Obx(() => controller.subjectList.isEmpty
                    ? Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CBTLoaderProgress(
                              isImage: false,
                              isGif: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: EmoticonsView(
                              text: "Please wait for select category and class",
                              button: TextButton(
                                  child: Card(
                                    color: CodebrightColor.cbtPrimarColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CBTTextNew(
                                        "Select",
                                        style: TStyle.f10_B
                                            .styleWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => {
                                        Get.to(CategoryView())!
                                            .then((value) async => {
                                                  controller.subjectList.value
                                                      .clear(),
                                                  await controller
                                                      .setUserDetails(),
                                                  await controller
                                                      .loadSubject(),
                                                  // await controller.loadSubject(),
                                                }),
                                      }),
                            ),
                          ),
                        ],
                      )
                    : _GridItems(
                        homeData,
                        controller,
                        mainMenuName: "",
                      )),
              ),
            ],
          )),
        ),
      ],
    );
  }

  Widget _mobile(List<DigiGyanModel?> homeData, List<String?> bannerResponse,
      BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Obx(() => controller.subjectList.isEmpty
                    ? Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CBTLoaderProgress(
                              isImage: false,
                              isGif: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: EmoticonsView(
                              text: "Please wait for select category and class",
                              button: TextButton(
                                  child: Card(
                                    color: CodebrightColor.cbtPrimarColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CBTTextNew(
                                        "Select",
                                        style: TStyle.f10_B
                                            .styleWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => {
                                        Get.to(CategoryView())!
                                            .then((value) async => {
                                                  controller.subjectList.value
                                                      .clear(),
                                                  await controller
                                                      .setUserDetails(),
                                                  await controller
                                                      .loadSubject(),
                                                  // await controller.loadSubject(),
                                                }),
                                      }),
                            ),
                          ),
                        ],
                      )
                    : _GridItems(
                        homeData,
                        controller,
                        mainMenuName: "",
                      )),
              ),
            ],
          )),
        ),
      ],
    );
  }

  errorMessage(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Alert",
      message: message,
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        // Get.toNamed(Routes.HOME_ADMIN);
      },
    );
  }
}

class _GridItems extends StatelessWidget {
  List<DigiGyanModel?> phMenuMain;
  final int gridCount;
  final int menuMainIndex;
  bool gradientCard;
  String mainMenuName;
  LearnController homeController;

  _GridItems(
    this.phMenuMain,
    this.homeController, {
    this.gridCount = 2,
    this.mainMenuName = "",
    this.menuMainIndex = 0,
    this.gradientCard = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isTablet = CBOResponsive.isTablet(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: phMenuMain.length,
        gridDelegate: GetPlatform.isWeb
            ? const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)
            : const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
        itemBuilder: (BuildContext context, int childIndex) {
          final phMenu = this.phMenuMain[childIndex];
          return GestureDetector(
            onTap: () {
              homeController.openMenu(phMenu!);
            },
            child: card3Count(childIndex, context),
          );
        },
      ),
    );
  }

  Widget card3Count(int index, BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: CodebrightColor.cbtPrimarColor,
      child: phMenuMain[index]!.image.isEmpty
          ? Image.asset(
              AppImages.cbtLogo,
              height: 250,
              // width: 35,
            )
          : ClipRRect(
              child: CachedNetworkImage(
                imageUrl: ApiUrls.baseUrlImage(phMenuMain[index]!.image),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                      // colorFilter:
                      //     ColorFilter.mode(Colors.red.shade50, BlendMode.colorBurn),
                    ),
                  ),
                ),
                height: 200,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  AppImages.cbtLogo,
                  height: 250,
                  // width: 35,
                ),
                fit: BoxFit.cover,
//        fit: widget.imageHeight > 0 ? BoxFit.cover : BoxFit.fitWidth,
              ),
            ),
    );
  }
}
