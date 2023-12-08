import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'dot_indicator.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<String?> imageUrls;
  final BorderRadius imageBorderRadius;
  final double aspectRatio;
  final double imagePadding;
  final int activeIndex;
  final int delayTimeInSecond;
  final bool autoSlideOff;
  Function(int)? indexCallBack;
  final bool showImageName;
  final bool isInNormalImageMode;

  ImageSliderWidget(
      {Key? key,
      required this.imageUrls,
      required this.imageBorderRadius,
      this.aspectRatio = (16 / 9),
      this.imagePadding = 0,
      this.activeIndex = 0,
      this.delayTimeInSecond = 5,
      this.autoSlideOff = false,
      this.isInNormalImageMode = true,
      this.indexCallBack,
      this.showImageName = false})
      : super(key: key);

  @override
  ImageSliderWidgetState createState() => ImageSliderWidgetState();
}

class ImageSliderWidgetState extends State<ImageSliderWidget> {
  List<Widget> _pages = [];

  int page = 0;
  int _currentPage = 0;

  final _controller = PageController();
  Timer? timer;

  @override
  void initState() {
    _currentPage = widget.activeIndex;

    _pages = widget.imageUrls.map((url) {
      return _buildImagePageItem(url!);
    }).toList();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_controller.hasClients) {
        _controller.animateToPage(_currentPage,
            duration: Duration(milliseconds: 1), curve: Curves.easeIn);
        if (!widget.autoSlideOff) {
          timer = Timer.periodic(Duration(seconds: widget.delayTimeInSecond),
              (Timer timer) {
            if (_currentPage < _pages.length - 1) {
              _currentPage++;
            } else {
              _currentPage = 0;
            }
            _controller.animateToPage(
              _currentPage,
              duration: Duration(milliseconds: 350),
              curve: Curves.easeIn,
            );
          });
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // if(timer != null){
    timer?.cancel();
    _controller.dispose();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return _buildingImageSlider();
  }

  Widget _buildingImageSlider() {
    return widget.aspectRatio > 0
        ? Card(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: AspectRatio(
              aspectRatio: widget.aspectRatio,
              child: Container(
                // margin: const EdgeInsets.only(top: 8),
//            height: widget.imageHeight,
                decoration: BoxDecoration(
                  borderRadius: widget.imageBorderRadius,
                ),
                padding: EdgeInsets.all(widget.imagePadding),
                child: Stack(
                  children: [
                    _buildPagerViewSlider(),
                    _buildDotsIndicatorOverlay(),
                  ],
                ),
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.all(widget.imagePadding),
            child: Stack(
              children: [
                _buildPagerViewSlider(),
                _buildDotsIndicatorOverlay(),
              ],
            ),
          );
  }

  Widget _buildPagerViewSlider() {
    return Positioned.fill(
      child: PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index % _pages.length];
        },
        onPageChanged: (int p) {
          setState(() {
            page = p;
            _currentPage = p;
          });

          if (widget.indexCallBack != null) {
            widget.indexCallBack!(p);
          }
        },
      ),
    );
  }

  Positioned _buildDotsIndicatorOverlay() {
    return Positioned(
      bottom: 4.0,
      left: 0.0,
      right: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: DotsIndicator(
          color: Theme.of(context).primaryColor,
          controller: _controller,
          itemCount: _pages.length,
          onPageSelected: (int page) {
            _controller.animateToPage(
              page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
        ),
      ),
    );
  }

  Widget _buildImagePageItem(String imgUrl) {
    return widget.showImageName
        ? Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: widget.imageBorderRadius,
                    child: _buildImage(imgUrl)),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CBTTextNew(
                    "${imgUrl.split("/").last.split(".").first.toUpperCase()}",
                    mBold: true,
                  ),
                )
              ],
            ),
          )
        : _buildImage(imgUrl);
  }

  Widget _buildImage(String imgUrl) {
    return /*imgUrl.startsWith("http")
        ? */
        GetPlatform.isWeb
            ? OctoImage(
                image: NetworkImage(imgUrl),
                progressIndicatorBuilder: (context, progress) {
                  double? value;
                  var expectedBytes = progress?.expectedTotalBytes;
                  if (progress != null && expectedBytes != null) {
                    value = progress.cumulativeBytesLoaded / expectedBytes;
                  }
                  return CircularProgressIndicator(value: value);
                },
                errorBuilder: (context, error, stacktrace) =>
                    const Icon(Icons.error),
              )
            : CachedNetworkImage(
                imageUrl: imgUrl,
                placeholder: (context, url) => Center(
                  child: Platform.isIOS
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fitHeight,
//        fit: widget.imageHeight > 0 ? BoxFit.cover : BoxFit.fitWidth,
              );
//         ? Center(
//             child: Image(
//               image: NetworkImage(imgUrl),
//             ),
//           )
//         : InteractiveViewer(
//             child: Image.file(
//               File(imgUrl),
//               fit: widget.isInNormalImageMode ? BoxFit.contain : BoxFit.fill,
//               // fit: BoxFit.cover,
//               alignment: Alignment.center,
//             ),
//           );
  }
}
