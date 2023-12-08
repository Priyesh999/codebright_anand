import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'company_form_controller.dart';

class CategoryItem extends StatelessWidget {
  final DigiGyanModel post;
  final int index;
  final CategoryController controller;
  final int isSelectedPosition;

  const CategoryItem({
    Key? key,
    required this.post,
    required this.index,
    required this.controller,
    required this.isSelectedPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: isSelectedPosition == index ? Colors.green : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: post.image.isNotEmpty
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
                            imageUrl: ApiUrls.baseUrlImage(post.image),
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
                        height: 100,
                      ),
                    ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CBTTextNew(
                    post.title,
                    style: TStyle.f16_B.styleWith(
                      color: post.selected ? Colors.white : Colors.black,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
