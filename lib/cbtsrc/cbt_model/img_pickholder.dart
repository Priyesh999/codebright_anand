import 'dart:io';

class ImgPickHolder {
  bool isUploaded;
  String? localImgPath;
  String imgWebUrl;
  File? imgFile;
  String fileName;

  ImgPickHolder(this.localImgPath,
      {this.imgWebUrl = "",this.fileName = "", this.isUploaded = false, this.imgFile});
}

class ImageUploadResponse {
  String url;
  String filename;

  ImageUploadResponse({
    required this.url,
    required this.filename,
  });
}
