import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_model/cbt_common_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:octo_image/octo_image.dart';

class VisionItem extends StatelessWidget {
  final CBTCommonModel post;
  final bool isEdit;
  final int index;
  final int isSelectedPosition;
  final DesignationLFController controller;

  const VisionItem(
      {Key? key,
      required this.post,
      required this.isEdit,
      required this.index,
      required this.isSelectedPosition,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      transformAlignment: AlignmentDirectional.topCenter,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        //DecorationImage
        // border: Border.all(
        //   color: Colors.red.shade100,
        //   width: 1,
        // ), //Border.all
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.red.shade100,
            offset: const Offset(
              1.0,
              1.0,
            ), //Offset
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: isSelectedPosition == index ? Colors.green : Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: "" == "j"
                  ? GetPlatform.isWeb
                      ? OctoImage(
                          image: NetworkImage(post.image),
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
                            imageUrl: post.image,
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
                        )
                  : ClipRect(
                      child: Image.asset(
                        post.image,
                        // height: 100,
                        // width: 100,
                      ),
                    ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CBTTextNew(
                    post.title,
                    style: TStyle.f16_B.styleWith(
                        color: post.selected ? Colors.white : Colors.black,
                        fontFamily: AppFontsNeo.leagueBold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
