import 'package:carousel_slider/carousel_slider.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/core/loc.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designaton_item.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/emoticons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../cbt_helpers/cbt_loader.dart';
import '../../../widgets/default_app_baar.dart';

class DesignationLFView extends GetView<DesignationLFController> {
  DigiGyanModel cbtCommonModel;

  DesignationLFView(this.cbtCommonModel);

  @override
  Widget build(BuildContext context) {
    controller.loadDesignation(cbtCommonModel, context);
    return Scaffold(
      appBar: CbtAppBar(
        title: cbtCommonModel.title,
      ),
      body: Obx(
        () => controller.isLoading.value?CBTLoaderProgress(
          isImage: false,
          isGif: true,
        ):Container(
          child: Column(
            children: [
              subjectImage(context, cbtCommonModel.image),
              Expanded(
                flex: 1,
                child: controller.desDataList.isNotEmpty
                    ? departmentList()
                    : EmoticonsView(
                        text: "${LocaleKeys.no.tr} "
                            "${LocaleKeys.sourceScreen_extensions.tr}",
                        button: TextButton(
                          child: Text(LocaleKeys.sourceScreen_reload.tr),
                          onPressed: () => controller.onReady(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget departmentList() {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: GetPlatform.isWeb
                          ? 4
                          : 2 /*,
                          childAspectRatio: 8 / 2*/
                      ),
                  itemCount: controller.desDataList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => {
                      controller.onUpdateListClick(index, isView: true),

                      // controller.onReady()
                    },
                    child: Obx(
                      () => SizedBox(
                        child: VisionItem(
                          isEdit: false,
                          post: controller.desDataList.value[index],
                          controller: controller,
                          index: index,
                          isSelectedPosition:
                              controller.isSelectedPosition.value,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  subjectImage(BuildContext context, String image) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CarouselSlider(
          items: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 150,
              //BoxDecoration Widget
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(ApiUrls.cbtBaseUrl(image)),
                  fit: BoxFit.fill,
                ), //DecorationImage
                border: Border.all(
                  color: Colors.lightGreenAccent,
                  width: 1,
                ), //Border.all
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.lightGreenAccent,
                  //   offset: const Offset(
                  //     1.0,
                  //     1.0,
                  //   ), //Offset
                  //   blurRadius: 10.0,
                  //   spreadRadius: 2.0,
                  // ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ), //BoxDecoration
            ),
          ],
          options: CarouselOptions(
            height: /*GetPlatform.isWeb?700:*/ 250,
            // aspectRatio: 16 / 9,
            aspectRatio: 2.0,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInCirc,
            enlargeCenterPage: true,
            enlargeFactor: /*GetPlatform.isWeb?0.5:*/ 0.2,
            // onPageChanged: callbackFunction,
            scrollDirection: /*GetPlatform.isWeb?Axis.vertical:*/
                Axis.horizontal,
          )),
    );
  }
}

Iterable<E> mapIndexed<E, T>(
    Iterable<T>? items, E Function(int index, T item) f) sync* {
  var index = 0;
  if (items == null) return;
  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}
