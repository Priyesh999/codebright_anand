class ImagePreviewHolder {
  List<String> imageURLs;
  String pageTitle;
  int activeIndex = 0;
  int delayInSecond;

  ImagePreviewHolder(this.imageURLs, {this.pageTitle = "", this.activeIndex = 0, this.delayInSecond = 5});
}
