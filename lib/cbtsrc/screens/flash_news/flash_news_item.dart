import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/controller_flash.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/flash_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class FlashNewsItemItem extends StatelessWidget {
  final FlashNewsModel post;
  final int index;
  final FlashNewsController controller;
  final int isSelectedPosition;

  const FlashNewsItemItem({
    Key? key,
    required this.post,
    required this.index,
    required this.controller,
    required this.isSelectedPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade50,
            offset: const Offset(
              1.0,
              1.0,
            ), //Offset
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: isSelectedPosition == index ? Colors.green : Colors.grey.shade200,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            post.prUrl!.isNotEmpty
                ? GetPlatform.isWeb
                    ? OctoImage(
                        image: NetworkImage( ApiUrls.baseUrlImage(post.prUrl!)),
                        progressIndicatorBuilder: (context, progress) {
                          double? value;
                          var expectedBytes = progress?.expectedTotalBytes;
                          if (progress != null && expectedBytes != null) {
                            value =
                                progress.cumulativeBytesLoaded / expectedBytes;
                          }
                          return CircularProgressIndicator(value: value);
                        },
                        errorBuilder: (context, error, stacktrace) =>
                            const Icon(Icons.error),
                      )
                    : ClipRect(
                        child: CachedNetworkImage(
                          imageUrl: ApiUrls.baseUrlImage(post.prUrl!),
                          height: 40,
                          width: 40,
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
                      'assets/images/user.png',
                      height: 40,
                    ),
                  ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CBTTextNew(
                          post.prTitle!,
                          style: TStyle.f14_B.styleWith(
                              color:
                                  post.selected ? Colors.white : Colors.black,
                              fontFamily: AppFontsNeo.leagueBold),
                        ),
                        CBTTextNew(
                          post.prDescription!,
                          maxLine: 3,
                          style: TStyle.f12_S.styleWith(
                              color:
                                  post.selected ? Colors.white : Colors.black,
                              fontFamily: AppFontsNeo.leagueSemiBold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CBTTextNew(
                        // ""
                        CboDateUtils.formatWithTime(post.prCreatedAt!,
                            format: DateTimeFormat.dmy),
                        style: TStyle.f8_B.styleWith(
                            color: post.selected ? Colors.white : Colors.black,
                            fontFamily: AppFontsNeo.leagueBold),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }




}
