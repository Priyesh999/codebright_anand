import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbo_responsive.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_model/image_preview_holder.dart';
import 'package:digigyan/cbtsrc/cbt_model/img_pickholder.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:digigyan/cbtsrc/utils/camera_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'full_screen_image.dart';

class CBOImagePicker extends StatefulWidget {
  final Function(ImgPickHolder)? imgPathCallBack;
  final String? localImgpath;
  final String? title;
  final bool isServerUpload;
  final String? uploadUrl;
  final bool isInitialUpload;
  final double? height;
  final double? width;
  final bool? isGallery;
  final bool? isEditable;
  final bool? isFrontCamera;
  final bool? isTextHide;
  final bool? isLineNot;
  final String? alreadyUploadedUrl;

  @override
  _CBOImagePickerState createState() => _CBOImagePickerState();

  const CBOImagePicker(
      {Key? key,
      this.height,
      this.title,
      this.alreadyUploadedUrl,
      this.isFrontCamera = false,
      this.width,
      this.localImgpath,
      this.isInitialUpload = false,
      this.uploadUrl,
      this.isServerUpload = false,
      this.isTextHide = false,
      this.isGallery = false,
      this.isEditable = true,
      this.isLineNot = false,
      this.imgPathCallBack})
      : super(key: key);
}

class _CBOImagePickerState extends State<CBOImagePicker> {
  late Size pgSize;

  //device picked image path
  String _pickedimagepath = "";

  //if upload enable , uploading status
  String _imgUploadStatus = "";

  bool _isTab = false;

  @override
  void initState() {
    initialUpload();
    _pickedimagepath = widget.alreadyUploadedUrl ?? "";
    super.initState();
  }

  //setting uploading state msg.
  setUploadingState(String state, {bool showRetry = false}) {
    setState(() {
      _imgUploadStatus = state;
      if (showRetry) {
        _retry = true;
      }
    });
  }

  //Retry if failed.
  bool _retry = false;

  setRetryState(bool state) => setState(() => _retry = state);

  //ImagePicker holder
  ImgPickHolder imgPickHolder = ImgPickHolder("");
  late CameraUtils _cameraUtils = CameraUtils();

  @override
  Widget build(BuildContext context) {
    pgSize = MediaQuery.of(context).size;
    _isTab = CBOResponsive.isTablet(context);
    return GestureDetector(
      onTap: widget.localImgpath != null || _retry
          ? null
          : captureImageBasedOnPlatform,
      child: Container(
        height: widget.height,
        width: widget.width,
        // color: Colors.grey.shade100,
        decoration: widget.isLineNot == true
            ? BoxDecoration()
            : BoxDecoration(
                border: Border.all(width: 1.0),
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade100),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: _pickedimagepath.isNotEmpty ||
                      imgPickHolder.imgWebUrl.isNotEmpty
                  ? Container(
                      height: widget.height! - 8,
                      width: widget.width! - 8,
                      child: AppImages.getImagePreview(_pickedimagepath),
                    )
                  : OutlinedButton.icon(
                      onPressed: captureImageBasedOnPlatform,
                      icon: Icon(Icons.camera_alt),
                      label: CBTTextNew(widget.isTextHide == false
                          ? ((widget.title != null && widget.title?.length == 0)
                              ? widget.title
                              : "Select Image")!
                          : "")),
            ),
            if (_retry)
              Container(
                height: widget.height,
                width: widget.width,
                color: Colors.black45,
                child: IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    setRetryState(false);
                    if (widget.localImgpath != null &&
                        widget.uploadUrl != null &&
                        widget.isInitialUpload) {
                      if (await MethodUtils.isInternetPresent()) {
                        initialUpload();
                      }
                    } else {
                      if (await MethodUtils.isInternetPresent()) {
                        setUploadingState("Uploading..");
                        ImageUploadResponse? imgWebUrl =
                            await _cameraUtils.uploadImage2Server(
                                widget.uploadUrl!, _pickedimagepath);
                        if (imgWebUrl != null) {
                          imgPickHolder.fileName = imgWebUrl.filename;
                          imgPickHolder.isUploaded = true;
                          imgPickHolder.imgWebUrl = imgWebUrl.url;
                          _pickedimagepath = imgWebUrl.url;
                          setUploadingState("Uploaded successfully");
                        } else {
                          imgPickHolder.localImgPath = _pickedimagepath;
                          setUploadingState("Uploading failed, retry",
                              showRetry: true);
                        }
                      } else {
                        imgPickHolder.localImgPath = _pickedimagepath;
                      }
                      widget.imgPathCallBack!(imgPickHolder);
                    }
                  },
                ),
              ),
            Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CBTTextNew(
                    _imgUploadStatus,
                    style: TStyle.f16_B.styleWith(color: Colors.red),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  //Initiating upload if initial upload enabled.
  Future<void> initialUpload() async {
    if (widget.localImgpath != null &&
        widget.uploadUrl != null &&
        widget.isInitialUpload) {
      if (await MethodUtils.isInternetPresent()) {
        setUploadingState("Uploading..");
        ImageUploadResponse? _imgWebUrl = await _cameraUtils.uploadImage2Server(
            widget.uploadUrl!, widget.localImgpath!);
        if (_imgWebUrl != null) {
          setUploadingState("Uploaded successfully");
          imgPickHolder.localImgPath = widget.localImgpath!;
          imgPickHolder.fileName = _imgWebUrl.filename;
          imgPickHolder.isUploaded = true;
          imgPickHolder.imgWebUrl = _imgWebUrl.url;
          _pickedimagepath = _imgWebUrl.url;
        } else {
          imgPickHolder.localImgPath = widget.localImgpath!;
          setUploadingState("Uploading failed, retry", showRetry: true);
        }
      } else {
        imgPickHolder.localImgPath = widget.localImgpath!;
        setUploadingState("", showRetry: false);
      }
      widget.imgPathCallBack!(imgPickHolder);
    }
  }

  //----------------------------UPLOAD IMAGE 2 SERVER--------------------------------

  void captureImageBasedOnPlatform() {
    try {
      // if (Platform.isAndroid) {
      // if (widget.isGallery!) {
      openButtomSheet(widget.isGallery!, widget.isEditable!);
      // captureAndUpload();
      // } else {
      //   captureFromNativeAndroidCameraAndUpload();
      // }
      // } else if (Platform.isIOS) {
      //   captureFromPluginCameraAndUpload();
      // }
    } on Exception catch (e) {
      // CboToast.showText(text: "No Camera found");
    }
  }

  //----------------------Pick image from Camera/gallery------------------------
  Future<void> getImageFromDevice(
      {required Function(PickedFile) selectionCallback}) async {
    try {
      final img = await _cameraUtils.getImage(
        source: widget.isGallery! ? ImageSource.gallery : ImageSource.camera,
        cameraDevice:
            widget.isFrontCamera! ? CameraDevice.front : CameraDevice.rear,
      );
      if (img != null) {
        selectionCallback(PickedFile(img));
      }
    } catch (e) {
      print("ERROR Capturing Image $e");
    }
  }

  //Capture image , upload to server if allowed.
  void captureFromPluginCameraAndUpload() {
    getImageFromDevice(selectionCallback: (v) async {
      _pickedimagepath = v.path;
      print("PATH:-> ${v.path}");
      if (widget.isServerUpload && widget.uploadUrl != null) {
        setUploadingState("Uploading..");
        ImageUploadResponse? imgWebUrl =
            await _cameraUtils.uploadImage2Server(widget.uploadUrl!, v.path);
        if (imgWebUrl != null) {
          imgPickHolder.localImgPath = v.path;
          imgPickHolder.isUploaded = true;
          imgPickHolder.fileName = imgWebUrl.filename;
          imgPickHolder.isUploaded = true;
          imgPickHolder.imgWebUrl = imgWebUrl.url;
          _pickedimagepath = imgWebUrl.url;
          setUploadingState("Uploaded successfully");
        } else {
          imgPickHolder.localImgPath = v.path;
          setUploadingState("Uploading failed, retry", showRetry: true);
        }
      } else {
        //Do not upload , give back local path.
        imgPickHolder.localImgPath = v.path;
        setUploadingState("", showRetry: false);
      }
      widget.imgPathCallBack!(imgPickHolder);
    });
  }

  Future<void> captureAndUpload(String data) async {
    final ImagePicker _picker = ImagePicker();
    try {
      // var image = await ImagePicker.pickImage(
      //     source: ImageSource.camera,
      //     imageQuality: 60,
      //     preferredCameraDevice: CameraDevice.rear);

      final pickedFile = await _picker
          .pickImage(
              source:
                  data == "CAMERA" ? ImageSource.camera : ImageSource.gallery,
              preferredCameraDevice: widget.isFrontCamera!
                  ? CameraDevice.front
                  : CameraDevice.rear)
          .then((pickedFile) async {
        if (pickedFile == null) {
          return;
        }
        _pickedimagepath = pickedFile.path;

        print("PATH:-> ${pickedFile.path}");

        if (widget.isServerUpload && widget.uploadUrl != null) {
          if (await MethodUtils.isInternetPresent()) {
            setUploadingState("Uploading..");
            ImageUploadResponse? imgWebUrl = await _cameraUtils
                .uploadImage2Server(widget.uploadUrl!, pickedFile.path);
            if (imgWebUrl != null) {
              imgPickHolder.localImgPath = pickedFile.path;
              imgPickHolder.fileName = imgWebUrl.filename;
              imgPickHolder.isUploaded = true;
              imgPickHolder.imgWebUrl = imgWebUrl.url;
              _pickedimagepath = imgWebUrl.url;
              setUploadingState("Uploaded successfully");
            } else {
              imgPickHolder.localImgPath = pickedFile.path;
              setUploadingState("Uploading failed, retry", showRetry: true);
            }
          } else {
            imgPickHolder.localImgPath = pickedFile.path;
            setUploadingState("", showRetry: false);
          }
          // imgPickHolder.localImgPath = pickedFile.path;
          widget.imgPathCallBack!(imgPickHolder);
        }
      });
      // setState(() async {
      // });
    } catch (e) {
      Navigator.pop(context);
    }
  }

  void openButtomSheet(bool isGallery, bool isEdit) {
    showModalBottomSheet(
        context: context,
        // backgroundColor: Colors.transparent,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              imgPickHolder.localImgPath!.isNotEmpty ||
                      _pickedimagepath.isNotEmpty ||
                      imgPickHolder.imgWebUrl.isNotEmpty
                  ? ListTile(
                      leading: const Icon(Icons.preview),
                      title: const Text('Preview'),
                      onTap: () {
                        var img = imgPickHolder.localImgPath!.isNotEmpty
                            ? imgPickHolder.localImgPath!
                            : _pickedimagepath;
                        final _previewHolder =
                            ImagePreviewHolder([img], pageTitle: "Attachment");
                        final _targetScreen =
                            FullScreenImagesView(_previewHolder);
                        // openScreenAsPlatformWiseRoute(context, _targetScreen,
                        //         isFullScreen: true)
                        //     .whenComplete(() => Navigator.pop(
                        //         context)); // Navigator.pop(context);
                      },
                    )
                  : SizedBox.shrink(),
              // imgPickHolder.localImgPath!.isNotEmpty ? Divider() : SizedBox.shrink(),
              isGallery && isEdit
                  ? ListTile(
                      leading: const Icon(Icons.photo),
                      title: const Text('Gallery'),
                      onTap: () {
                        captureAndUpload("GALLERY");
                        Navigator.pop(context);
                      },
                    )
                  : SizedBox(),
              // isGallery ? Divider() : SizedBox.shrink(),
              isEdit
                  ? ListTile(
                      leading: const Icon(Icons.camera),
                      title: const Text('Camera'),
                      onTap: () {
                        captureAndUpload("CAMERA");
                        Navigator.pop(context);
                        // captureFromNativeAndroidCameraAndUpload().whenComplete(() => Navigator.pop(context));
                      },
                    )
                  : SizedBox(),
              // Divider(),
              ListTile(
                leading: const Icon(Icons.clear),
                title: const Text('Cancel'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }
}
