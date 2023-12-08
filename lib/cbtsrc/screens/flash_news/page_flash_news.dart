import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbt_loader.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/category_list/category_lf_form/company_form_view.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/controller_flash.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/flash_model.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/flash_news_item.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class FlashNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(FlashNewsController());
    return FlashNewsPageState();
  }
}

class FlashNewsPageState extends GetView<FlashNewsController> {
  String title;

  FlashNewsPageState({this.title = "Flash News"});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CbtAppBar(
            title: title,
          ),
          body: Center(
            child: Container(
              child: Column(
                children: [
                  Visibility(
                    visible: controller.isLoading.value,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            child: Card(
                              color: CodebrightColor.cbtPrimarColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CBTTextNew(
                                  title,
                                  style: TStyle.f10_B
                                      .styleWith(color: Colors.white),
                                ),
                              ),
                            ),
                            onPressed: () => {controller.loadSubject()}),
                      ],
                    ),
                  ),
                  Expanded(
                    child: homeBody(controller.flashNewsList.value,
                        controller.bannerList.value, context),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget homeBody(List<FlashNewsModel?> homeData, List<String?> bannerResponse,
      BuildContext context) {
    return Container(
      child: GetPlatform.isWeb
          ? _web(homeData, bannerResponse, context)
          : _mobile(homeData, bannerResponse, context),
    );
  }

  Widget _web(List<FlashNewsModel?> homeData, List<String?> bannerResponse,
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
                child: Obx(
                  () => controller.flashNewsList.isEmpty
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
                                text:
                                    "Please wait for select category and class",
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
                                                    controller
                                                        .flashNewsList.value
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
                      : Expanded(
                          child: GetPlatform.isAndroid || GetPlatform.isIOS
                              ? ListView.builder(
                                  itemCount: controller.flashNewsList.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () => {
                                      // controller.onUpdateListClick(index,
                                      //     isView: controller.isView.value,
                                      //     isDelete: controller.isDelete.value),

                                      // controller.onReady()
                                    },
                                    child: Obx(
                                      () => FlashNewsItemItem(
                                        post: controller.flashNewsList[index]!,
                                        controller: controller,
                                        index: index,
                                        isSelectedPosition:
                                            controller.isSelectedPosition.value,
                                      ),
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 6 / 2),
                                  itemCount: controller.flashNewsList.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () => {
                                      // controller.onUpdateListClick(index,
                                      //     isView: controller.isView.value,
                                      //     isDelete: controller.isDelete.value),

                                      // controller.onReady()
                                    },
                                    child: Obx(
                                      () => SizedBox(
                                        height: 200,
                                        child: FlashNewsItemItem(
                                          post:
                                              controller.flashNewsList[index]!,
                                          controller: controller,
                                          index: index,
                                          isSelectedPosition: controller
                                              .isSelectedPosition.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  Widget _mobile(List<FlashNewsModel?> homeData, List<String?> bannerResponse,
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
                child: Obx(
                  () => controller.flashNewsList.isEmpty
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
                                text: "",
                                button: TextButton(
                                    child: Card(
                                      color: CodebrightColor.cbtPrimarColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CBTTextNew(
                                          "Refresh",
                                          style: TStyle.f10_B
                                              .styleWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    onPressed: () =>
                                        {controller.loadSubject()}),
                              ),
                            ),
                          ],
                        )
                      : Expanded(
                          child: GetPlatform.isAndroid || GetPlatform.isIOS
                              ? ListView.builder(
                                  itemCount: controller.flashNewsList.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () => {
                                      // controller.onUpdateListClick(index,
                                      //     isView: controller.isView.value,
                                      //     isDelete: controller.isDelete.value),

                                      _show(
                                          context,
                                          controller
                                              .flashNewsList.value[index]!)

                                      // controller.onReady()
                                    },
                                    child: Obx(
                                      () => FlashNewsItemItem(
                                        post: controller.flashNewsList[index]!,
                                        controller: controller,
                                        index: index,
                                        isSelectedPosition:
                                            controller.isSelectedPosition.value,
                                      ),
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount: controller.flashNewsList.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () => {
                                      // controller.onUpdateListClick(index,
                                      //     isView: controller.isView.value,
                                      //     isDelete: controller.isDelete.value),

                                      // controller.onReady()
                                    },
                                    child: Obx(
                                      () => SizedBox(
                                        height: 200,
                                        child: FlashNewsItemItem(
                                          post:
                                              controller.flashNewsList[index]!,
                                          controller: controller,
                                          index: index,
                                          isSelectedPosition: controller
                                              .isSelectedPosition.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  void _show(BuildContext ctx, FlashNewsModel flashNewsModel) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => Container(
              width: MediaQuery.of(ctx).size.width,
              // height: 250,
              color: Colors.white54,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GetPlatform.isWeb
                      ? OctoImage(
                          image: NetworkImage(flashNewsModel.prUrl!),
                          progressIndicatorBuilder: (context, progress) {
                            double? value;
                            var expectedBytes = progress?.expectedTotalBytes;
                            if (progress != null && expectedBytes != null) {
                              value = progress.cumulativeBytesLoaded /
                                  expectedBytes;
                            }
                            return CircularProgressIndicator(value: value);
                          },
                          errorBuilder: (context, error, stacktrace) =>
                              const Icon(Icons.error),
                        )
                      : ClipRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                ApiUrls.baseUrlImage(flashNewsModel.prUrl!),
                            height: 150,
                            width: MediaQuery.of(ctx).size.width,
                            placeholder: (context, url) => Center(
                              child: GetPlatform.isIOS
                                  ? const CupertinoActivityIndicator()
                                  : const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.fitHeight,
//        fit: widget.imageHeight > 0 ? BoxFit.cover : BoxFit.fitWidth,
                          ),
                        ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CBTTextNew(
                          // ""
                          CboDateUtils.formatWithTime(
                              flashNewsModel.prCreatedAt!,
                              format: DateTimeFormat.dmy),
                          style: TStyle.f8_B.styleWith(
                              color: Colors.black,
                              fontFamily: AppFontsNeo.leagueBold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CBTTextNew(
                      flashNewsModel.prTitle!,
                      style: TStyle.f14_B.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CBTTextNew(
                      flashNewsModel.prDescription!,
                      style: TStyle.f14_B.styleWith(
                        fontFamily: AppFontsNeo.leagueBold,
                      ),
                    ),
                  ),
                ],
              ),
            ));
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
