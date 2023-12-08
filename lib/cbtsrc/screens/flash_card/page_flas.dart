import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/controller_flas.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'bottom_buttons_row.dart';
import 'card_overlay.dart';
import 'flash_card_list/flash_card_list_model.dart';

class FlashPage extends StatelessWidget {
  late List<PrFlashCardDatum> flashCardsList;
  late String title;

  FlashPage({required this.flashCardsList, this.title = ""});

  @override
  Widget build(BuildContext context) {
    Get.put(FlashController());
    return FlashPageState(
      flashCardsList: flashCardsList,
      title: title,
    );
  }
}

class FlashPageState extends GetView<FlashController> {
  String title;
  late List<PrFlashCardDatum> flashCardsList;

  // late List<CarouselController> cr=List.empty(growable: true);
  late CarouselController cr = CarouselController();

  FlashPageState({required this.flashCardsList, this.title = ""});

  @override
  Widget build(BuildContext context) {
    controller.flashCount.value = 1;
    controller.subjectListCopy.value = flashCardsList;
    controller.subjectList.value = flashCardsList;

    return Obx(() => Scaffold(
          appBar: CbtAppBar(
            title: title,
            actionButtons: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                child: const Icon(Icons.comment),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                child: const Icon(Icons.bookmark_border),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                // openFilterSheet();
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.filter_alt_sharp,
                color: Colors.white,
              )),
          body: Center(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: homeBody(controller.subjectList,
                        controller.bannerList.value, context),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget homeBody(List<PrFlashCardDatum> homeData, List<String?> bannerResponse,
      BuildContext context) {
    return Container(
      child: GetPlatform.isWeb
          ? _web(homeData, bannerResponse, context)
          : _mobile(homeData, bannerResponse, context),
    );
  }

  Widget _web(List<PrFlashCardDatum> homeData, List<String?> bannerResponse,
      BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          // SizedBox(width: 10,),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SwipableStack(
                            // dragStartDuration: Duration(milliseconds: 800),
                            detectableSwipeDirections: const {
                              SwipeDirection.right,
                              SwipeDirection.left,
                            },
                            controller: controller.cSwip,
                            stackClipBehaviour: Clip.none,
                            onSwipeCompleted: (index, direction) {
                              // _controller.next(swipeDirection: direction);
                              // _controller1.next(swipeDirection: direction);
                              if (kDebugMode) {
                                print('$index, $direction');
                              }
                            },
                            horizontalSwipeThreshold: 0.8,
                            verticalSwipeThreshold: 0.8,
                            builder: (context, properties) {
                              final itemIndex = properties.index %
                                  controller.subjectList.length;

                              return Stack(
                                children: [
                                  ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl: ApiUrls.baseUrlImage(controller
                                          .subjectList
                                          .value[itemIndex == 0
                                              ? 0
                                              : controller.leftPos.value]
                                          .prImgPath!),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                            // colorFilter:
                                            //     ColorFilter.mode(Colors.red.shade50, BlendMode.colorBurn),
                                          ),
                                        ),
                                      ),
                                      fit: BoxFit.fitHeight,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        fit: BoxFit.fitHeight,
                                        AppImages.cbtLogo,
                                        // width: 35,
                                      ),

//        fit: widget.imageHeight > 0 ? BoxFit.cover : BoxFit.fitWidth,
                                    ),
                                  ),
                                  // more custom overlay possible than with overlayBuilder
                                  if (properties.stackIndex == 0 &&
                                      properties.direction != null)
                                    CardOverlay(
                                      swipeProgress: properties.swipeProgress,
                                      direction: properties.direction!,
                                    )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.comment),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.bookmark_border),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 10,
            color: Colors.blue,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SwipableStack(
                            // dragStartDuration: Duration(milliseconds: 800),
                            detectableSwipeDirections: const {
                              SwipeDirection.right,
                              SwipeDirection.left,
                            },
                            controller: controller.cSwip1,
                            stackClipBehaviour: Clip.none,
                            onSwipeCompleted: (index, direction) {
                              // _controller.next(swipeDirection: direction);
                              // _controller1.next(swipeDirection: direction);
                              // playAudio();
                              if (kDebugMode) {
                                print('$index, $direction');
                              }
                            },
                            horizontalSwipeThreshold: 0.8,
                            verticalSwipeThreshold: 0.8,
                            builder: (context, properties) {
                              final itemIndex = properties.index %
                                  controller.subjectList.length;

                              return Stack(
                                children: [
                                  ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl: ApiUrls.baseUrlImage(controller
                                          .subjectList
                                          .value[itemIndex == 0
                                              ? 1
                                              : controller.rightPos.value]
                                          .prImgPath!),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                            // colorFilter:
                                            //     ColorFilter.mode(Colors.red.shade50, BlendMode.colorBurn),
                                          ),
                                        ),
                                      ),
                                      fit: BoxFit.fitHeight,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        fit: BoxFit.fitHeight,
                                        AppImages.cbtLogo,
                                        // width: 35,
                                      ),

//        fit: widget.imageHeight > 0 ? BoxFit.cover : BoxFit.fitWidth,
                                    ),
                                  ),
                                  // more custom overlay possible than with overlayBuilder
                                  if (properties.stackIndex == 0 &&
                                      properties.direction != null)
                                    CardOverlay(
                                      swipeProgress: properties.swipeProgress,
                                      direction: properties.direction!,
                                    )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      // BottomButtonsRow(
                      //   onSwipe: (direction) {
                      //     _controller.next(swipeDirection: direction);
                      //     _controller1.next(swipeDirection: direction);
                      //   },
                      //   onRewindTap: _controller1.rewind,
                      //   canRewind: _controller1.canRewind,
                      // ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.comment),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.bookmark_border),
                    ),
                  ],
                )
              ],
            ),
          ),
          // SizedBox(width: 10,),
        ],
      ),
      BottomButtonsRow(
        onSwipe: (direction) {
          playAudio();

          if (direction == SwipeDirection.right) {
            controller.leftPos.value -= 2;
            controller.rightPos.value -= 2;
          } else {
            controller.leftPos.value += 2;
            controller.rightPos.value += 2;
          }

          controller.cSwip.next(swipeDirection: direction);
          controller.cSwip1.next(swipeDirection: direction);
        },
        onRewindTap: controller.cSwip1.rewind,
        canRewind: controller.cSwip1.canRewind,
        isLeft: controller.leftPos.value > 0,
        isRight: controller.leftPos.value < controller.subjectList.length,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ShakeWidget(
          child: TextButton(
              child: Card(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CBTTextNew(
                    // "Previous",
                    "Back",
                    style: TStyle.f16_B.styleWith(color: Colors.white),
                  ),
                ),
              ),
              onPressed: () => {Get.back()}),
        ),
      )
    ]);
  }

  Widget _mobile(List<PrFlashCardDatum> homeData, List<String?> bannerResponse,
      BuildContext context) {
    return SwipableStack(
      // dragStartDuration: Duration(milliseconds: 800),
      detectableSwipeDirections: const {
        SwipeDirection.right,
        SwipeDirection.left,
      },
      controller: controller.cSwip1,
      stackClipBehaviour: Clip.none,
      onSwipeCompleted: (index, direction) {
        // _controller.next(swipeDirection: direction);
        // _controller1.next(swipeDirection: direction);
        // playAudio();
        playAudio();
        if (kDebugMode) {
          print('$index, $direction');
        }
      },
      horizontalSwipeThreshold: 0.8,
      verticalSwipeThreshold: 0.8,
      builder: (context, properties) {
        final itemIndex = properties.index % controller.subjectList.length;

        return Stack(
          children: [
            ClipRRect(
              child: CachedNetworkImage(

                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                imageUrl: ApiUrls.baseUrlImage(controller
                    .subjectList
                    .value[itemIndex == 0 ? 1 : controller.rightPos.value]
                    .prImgPath!),
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
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  fit: BoxFit.fitHeight,
                  AppImages.cbtLogo,
                  // width: 35,
                ),

//        fit: widget.imageHeight > 0 ? BoxFit.cover : BoxFit.fitWidth,
              ),
            ),
            // more custom overlay possible than with overlayBuilder
            if (properties.stackIndex == 0 && properties.direction != null)
              CardOverlay(
                swipeProgress: properties.swipeProgress,
                direction: properties.direction!,
              )
          ],
        );
      },
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

  playAudio() {
    AudioPlayer().play(AssetSource('audio/psge_flip_m.mp3'));
  }
}
