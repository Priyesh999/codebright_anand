import 'package:digigyan/cbtsrc/cbt_helpers/cbo_responsive.dart';
import 'package:digigyan/cbtsrc/cbt_model/image_preview_holder.dart';
import 'package:digigyan/cbtsrc/utils/app_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'slider/simple_slider.dart';

class FullScreenImagesView extends StatefulWidget {
  ImagePreviewHolder imagePreviewHolder;

  FullScreenImagesView(this.imagePreviewHolder);

  @override
  _FullScreenImagesViewState createState() => _FullScreenImagesViewState();
}

class _FullScreenImagesViewState extends State<FullScreenImagesView> {
  int currentActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isTablet = CBOResponsive.isTablet(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("${widget.imagePreviewHolder.pageTitle} ",
            style: AppStyles.getTextStyleColor(true, 18, textColor: Colors.white)),
        centerTitle: false,
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: widget.imagePreviewHolder.imageURLs.length > 0
            ? Container(
                child: ImageSliderWidget(
                  aspectRatio: isTablet ? 1: 6 / 9,
//                imageHeight: (MediaQuery.of(context).size.height * 0.5),
                  imagePadding: 10,
                  imageUrls: widget.imagePreviewHolder.imageURLs,
                  imageBorderRadius: BorderRadius.circular(0),
                  activeIndex: widget.imagePreviewHolder.activeIndex,
                  delayTimeInSecond: widget.imagePreviewHolder.delayInSecond,
                ),
              )
            : Container(alignment: Alignment.center, child: Text("Image Not Found", style: AppStyles.getTextStyle(true, 18))),
      )),
    );
  }

  getParentImageWidget(imagePath, showBottomRound) => new BoxDecoration(
      borderRadius: new BorderRadius.only(
        bottomRight: new Radius.circular(showBottomRound ? 100.0 : 0),
        bottomLeft: new Radius.circular(showBottomRound ? 100.0 : 0),
      ),
      image: new DecorationImage(image: new NetworkImage(imagePath), fit: BoxFit.fitHeight));
}